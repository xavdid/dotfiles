# xavdid does holman does dotfiles

There's a lot more info in the original README. To see the difference between the original and my fork, click [this](https://github.com/xavdid/dotfiles/compare/master...holman:master). I've added and tweaked a lot, but the general structure is the same idea.

The below sections describe the file hierarchy in this repo and where to find something if you want to copy it.

## Setting Up a New Machine

1. Download this repo into `~/.dotfiles` - you probably can't `git clone` yet
2. run `./scripts/bootstrap`, which does all the proper linking and other setup/installs It runs the following:
   1. `dot`
      1. sets macos defaults
      2. installs homebrew itself
      3. runs the install script
   2. `install`
      1. runs `brew bundle`
      2. runs each `.../install.sh` file
   3. sets the `sentinel` file
   4. links all files
   5. creates some directories
3. now, open a new shell. This should be _pretty_ close to ready.
4. Install a Python version: `pyenv install 3.10.0`
5. Install a Node.js version: `nodenv install 16.13.0`
6. go through the manual settings below
7. Turn on file vault!
8. Get or set up an ssh key ([docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account))
9. Change the clone process for the dotfiles repo back to ssh (`git remote set-url origin git@github.com:xavdid/dotfiles.git`)

I think that's all!

## Manual Settings

This is a running list of changes I need to make manually because I haven't found a way to automate them. If you know which plist controls these, please let me know!

- general
  - uncheck "close windows when quitting"
- dock
  - Uncheck double click title bar
- accessibility
  - pointer control > trackpad > check enable (with 3 finger)
- security
  - require password immediately
  - show a message when screen is locked
- mission control
  - activate with side mouse buttons
- keyboard
  - text -> uncheck all checkboxes
- languages & region
  - general -> advanced -> dates:
    - short: paste `y-MM-dd`

## Topical

Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "Java" — you can simply add a `java` directory and put files in there. Anything with an extension of `.zsh` will get automatically included into your shell. Anything with an extension of `.symlink` will get symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](https://brew.sh) to install: things like Chrome and 1Password. Might want to edit this file before running any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `script/bootstrap`.
