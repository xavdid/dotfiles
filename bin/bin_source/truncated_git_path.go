package main

// a program used by starship (see https://starship.rs/config/#custom-commands)
// to print the directory and always show the git_repo_root (at any depth), if available

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

func makePurple(s string) string {
	return fmt.Sprintf("%%F{13}%s%%f", s)
}
func makeBoldCyan(s string) string {
	return fmt.Sprintf("%%B%%F{14}/%s%%f%%b", s)
}

func printPurple(s string) {
	fmt.Print(makePurple(s))
}

func main() {
	repo_root_call, err := exec.Command("git", "rev-parse", "--show-toplevel").Output()
	is_git_repo := err == nil
	cwd, err := os.Getwd()
	if err != nil {
		panic(err)
	}

	if is_git_repo {
		git_root := strings.TrimSpace(string(repo_root_call))
		repo_root_name := filepath.Base(git_root)
		purple_git_root := makePurple(repo_root_name)

		if git_root == cwd {
			fmt.Print(purple_git_root)
			return
		}

		sub_path, err := filepath.Rel(git_root, cwd)
		if err != nil {
			panic(err)
		}
		if len(strings.Split(sub_path, "/")) <= 2 {
			cyan_sub_path := makeBoldCyan(sub_path)
			fmt.Print(purple_git_root, cyan_sub_path)
			return
		}

		truncator := "…"
		remaining_parts := strings.Split(sub_path, "/")
		parts_to_print := append([]string{truncator}, remaining_parts[len(remaining_parts)-2:]...)
		cyan_truncated_path := makeBoldCyan(strings.Join(parts_to_print, "/"))

		fmt.Print(purple_git_root, cyan_truncated_path)

		return
	}
	home, err := os.UserHomeDir()
	if err != nil {
		panic(err)
	}

	home_replaced_path := strings.ReplaceAll(cwd, home, "~")

	if home_replaced_path == "~" {
		printPurple("🏠  ~")
		return
	}

	path_parts := strings.Split(home_replaced_path, "/")

	slice_from := 0
	if len(path_parts) > 3 {
		slice_from = len(path_parts) - 3
	}

	path_to_print := filepath.Clean(strings.Join(path_parts[slice_from:], "/"))

	printPurple(path_to_print)
}
