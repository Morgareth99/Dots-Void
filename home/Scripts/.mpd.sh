#!/bin/bash

mkdir -p ~/.config/mpd/{playlists}
touch  .config/mpd{mpd.conf,mpd.log,mpd.pid,mpdstate,sticker,tag_cache}

cat <<EOF > ~/.config/mpd/mpd.conf
music_directory    "$HOME/Música"
playlist_directory "$HOME/.config/mpd/playlists"
db_file            "$HOME/.config/mpd/tag_cache"
log_file           "$HOME/.config/mpd/mpd.log"
pid_file           "$HOME/.config/mpd/mpd.pid"
state_file         "$HOME/.config/mpd/mpdstate"
sticker_file       "$HOME/.config/mpd/sticker"

input {
    plugin              "curl"
}

decoder {
    plugin              "ffmpeg"
    enabled             "yes"
}

audio_output {
        type            "alsa"
        name            "default"
        mixer_type      "software"
}

save_absolute_paths_in_playlists  "no"
follow_outside_symlinks "yes"
follow_inside_symlinks "yes"
filesystem_charset     "UTF-8"
volume_normalization   "no"
audio_buffer_size      "2048"
auto_update            "yes"
replaygain             "track"
restore_paused         "yes"
EOF