alias py="ptpython" # nice interpreter
alias py3="python3 -m ptpython"
alias http="python -m http.server"

function venv() {
  if [[ ! -d .venv ]];then
    python -m venv .venv
  fi

  source ./.venv/bin/activate
}
alias pir="venv && pip install -r requirements.txt"
alias pdump="pip freeze > requirements.txt"

# or, just use poetry
