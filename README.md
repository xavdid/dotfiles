# xavdid does holman does dotfiles

This repo is all of the files I use to power my macOS-specific development environment. The overall structure is based on (and originally forked from) the work of [Zach Holman](https://github.com/holman/dotfiles), though I've diverged pretty far at this point.

I've built these with a heavy focus on:

- setting up a new mac laptop from scratch
- providing sensible locations for commands (no more thousand-line bash files)
- failing gracefully if requirements aren't available at runtime

The below sections describe the file hierarchy in this repo and where to find something if you want to copy it.

## Organization

Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "Java" — you can simply add a `java` directory and put files in there. Anything with an extension of `.zsh` will get automatically included into your shell. Anything with an extension of `.symlink` will get symlinked without extension into `$HOME` when you run `script/bootstrap`.

### Local-Only Setup

If you have dotfiles content you want to include, but don't want to check into source (such as aliases related to proprietary commands, etc), you can use the following hook files:

- `~/.local_pre_setup.zsh` (runs at the very start of the `.zshrc` evaluation)
- `~/.local_post_setup.zsh` (runs last, after `.zshrc` is set up)

Make sure to back those up separately!

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
4. Install a Python version: `pyenv install 3.11.0`
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
  - store it on left
- accessibility
  - pointer control > trackpad > check enable (with 3 finger)
- security
  - require password immediately
  - show a message when screen is locked
- mission control
  - activate with side mouse buttons
- keyboard
  - text -> uncheck all checkboxes
  - modifier keys > caps lock -> esc
  - shortcuts > spoitlight > uncheck
- trackpad
  - tap to click > uncheck
- languages & region
  - general -> advanced -> dates:
    - short: paste `y-MM-dd`

### Finder Preferences

In the finder app preferences, set the following items to show in the sidebar (and then re-order them accordingly):

1. Home
2. Desktop
3. Applications
4. Airdrop
5. Downloads

### Shell Setup

- I've included a compiled version of my [truncated-directory](https://github.com/xavdid/truncated-directory) project to display the current directory. If you're on a computer that has weird signing requirements, then you'll have to build it manually. Follow the instructions in that repo and update your [starship config](https://starship.rs/config/) accordingly.
- You may also need to change your shell manually, using `chsh -s /bin/zsh`.

### Mouse

1. Pair your bluetooth mouse (in Bluetooth settings)
2. mission control -> keyboard/mouse shortcuts
   1. Mission Control: MB5
   2. Show Desktop: MB4
