# USAGE
# 1. Copy a URL
# 2. Run `imgsav filename.extension from post root
# 3. Paste into image markdown

function imgsav () {
  curl -s "$(pbpaste)" > "./images/$1"; printf "./images/$1" | pbcopy;
}
