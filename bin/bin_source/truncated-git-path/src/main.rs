use std::{
    env::current_dir,
    path::{Component, PathBuf},
    process::Command,
};

use home::home_dir as get_home_dir;

fn make_purple(s: &str) -> String {
    format!("%F{{13}}{}%f", s)
}

fn make_bold_cyan(s: &str) -> String {
    format!("%B%F{{14}}/{}%f%b", s)
}

fn print_purple(s: &str) {
    print!("{}", make_purple(s));
}

fn main() {
    let repo_root_call = Command::new("git")
        .arg("rev-parse")
        .arg("--show-toplevel")
        .output()
        .expect("something went wrong");

    let cwd = current_dir().expect("err fetching cwd");

    if repo_root_call.status.success() {
        let git_root = PathBuf::from(
            String::from_utf8(repo_root_call.stdout)
                .expect("unable to convert git repo root to string")
                .trim(),
        );

        let repo_name = git_root
            .file_name()
            .expect("unable to extract directory name from git_root");

        let purple_git_root = make_purple(repo_name.to_str().unwrap());

        if git_root == cwd {
            print!("{purple_git_root}");
            return;
        }

        let sub_path = cwd
            .strip_prefix(git_root)
            .expect("unable to strip git root from cwd");

        let sub_path_components = sub_path.components().count();

        if sub_path_components <= 2 {
            let cyan_sub_path = make_bold_cyan(&sub_path.display().to_string());
            print!("{purple_git_root}{cyan_sub_path}");
            return;
        }

        let truncated_path = &sub_path
            .components()
            .skip(sub_path_components - 2)
            .filter_map(|comp| comp.as_os_str().to_str().map(String::from))
            .collect::<Vec<String>>()
            .join("/");

        let cyan_truncated_path = make_bold_cyan(&format!("…/{truncated_path}"));

        print!("{purple_git_root}{cyan_truncated_path}");
    } else {
        let home_dir = get_home_dir().expect("unable to get home dir");
        println!("{:?}", cwd);

        if home_dir == cwd {
            print_purple("🏠 ~");
            return;
        }

        // clean if we're under home
        let cwd = if cwd.starts_with(&home_dir) {
            let mut cleaned = PathBuf::from("~");
            cleaned.push(
                cwd.strip_prefix(&home_dir)
                    .expect("unable to strip homedir prefix from cwd"),
            );
            cleaned
        } else {
            cwd
        };

        let num_parts = cwd.components().count();

        let slice_from = if num_parts > 3 { num_parts - 3 } else { 0 };

        let cleaned_path = cwd
            .components()
            .skip(slice_from)
            .filter_map(|comp| comp.as_os_str().to_str().map(String::from))
            .collect::<Vec<String>>()
            .join("/");

        print_purple(&cleaned_path);
    }
}
