function song() {
    yt-dlp "$1" -x --audio-format mp3 -o '%(title)s.%(ext)s'
}

function cash-grab() {
    # call with: cash-grab "full url" "ep #" "title", e.g.
    # cash-grab "https://www.patreon.com/posts/cash-grab-16-and-92958912" 16 "Natalie Palamides and her many bees"
    yt-dlp --cookies-from-browser firefox "$1" -o "$DROPBOX/Archive/Videos/cashgrab/Cash Grab - Episode $2 - $3.%(ext)s"
}
