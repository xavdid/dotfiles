alias py="ptpython" # nice interpreter
alias py3="python3 -m ptpython"
alias http="python -m http.server"

function venv() {
  possible_names=('.venv' 'venv')
  for name in ${possible_names[*]};
  do
    if [[ -d $name ]];then
      source ./$name/bin/activate
      return
    fi
  done

  # If it gets here, none of the possible names exist, so create and activate `.venv`
  python -m venv .venv
  source ./.venv/bin/activate
}

alias pir="venv && pip install -r requirements.txt"
alias pdump="pip freeze > requirements.txt"

# or, just use poetry
