function book()
{
  upload_books "$(pbpaste)"
}

function audiobook()
{(
  # parens so the whole shell doesn't die on error
  if [ $# -eq 0 ]; then
      echo "ERR: Pass the path to the .odm file as the first (and only) arg"
      exit 1
  fi
  set -e
  odmpy dl "$1" --downloaddir ~/Downloads/audiobooks -mc --mergeformat m4b --nobookfolder
  echo -n "odmpy ret $1" | pbcopy
  echo "\nDone! The command to return the loan has been copied to the clipboard."
)}
