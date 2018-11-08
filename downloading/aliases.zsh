
function song() {
    youtube-dl "$1" -x --audio-format mp3 -o '%(title)s.%(ext)s'
}
