#!/bin/bash

WATCH_DIR="watch_dir"
TRANSCRIBE_DIR="transcriptions"

mkdir -p "$WATCH_DIR"
mkdir -p "$TRANSCRIBE_DIR"

if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg could not be found. Please install ffmpeg."
    exit
fi

inotifywait -m "$WATCH_DIR" -e create -e moved_to |
    while read path action file; do
        if [[ "$file" =~ \.(m4a|mp3|wav)$ ]]; then
            base_name=$(basename "$file" .${file##*.})
            ffmpeg -i "$WATCH_DIR/$file" "$WATCH_DIR/$base_name.wav"
            whisper "$WATCH_DIR/$base_name.wav" > "$TRANSCRIBE_DIR/$base_name.txt"
            echo "Transcribed $file to $TRANSCRIBE_DIR/$base_name.txt"
        fi
    done

