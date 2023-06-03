# misc synced files

From the destination, run `ln -s $DOTFILES/config/<some file> .`

| file                   | purpose                 | destination                               |
| ---------------------- | ----------------------- | ----------------------------------------- |
| `config.yaml`          | `lsd` config file       | `~/.config/lsd`                           |
| `RectangleConfig.json` | `rectangle` config file | just import it manually                   |
| `config.py`            | `ptpython` config file  | `~/Library/Application\ Support/ptpython` |
| `starship.toml`        | Starship prompt config  | No need to link, is referenced in `zshrc` |
| `litecli.ini`          | LiteCLI config          | `~/.config/litecli/config`                |

## Karabiner

Because karabiner is a directory, it gets special treatment. From `~/.config/` run:

`ln -s /Users/xavdid/.dotfiles/config/karabiner/ $(pwd)`
