# misc synced files

From the destination, run `ln -s $DOTFILES/config/<some file> .`

| file                   | purpose                            | destination                                |
| ---------------------- | ---------------------------------- | ------------------------------------------ |
| `config.yaml`          | `lsd` config file                  | `~/.config/lsd`                            |
| `Shortcuts.json`       | `spectacle` config file            | `~/Library/Application\ Support/Spectacle` |
| `RectangleConfig.json` | `rectangle` config file            | just import it manually                    |
| `config.py`            | `ptpython` config file             | `~/Library/Application\ Support/ptpython`  |
| `karabiner/`           | `karabiner-elements` config folder | `~/.config/karabiner`                      |
| `starship.toml/`       | Starship prompt config             | No need to link, is referenced in `zshrc`  |
