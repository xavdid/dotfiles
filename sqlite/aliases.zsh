# prefer litecli if available
if $(litecli --version &>/dev/null); then
  alias sqlite3="litecli"
fi
