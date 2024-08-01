#!/bin/bash

DATA_DIR="data"
OUTPUT_DIR="transcriptions"

mkdir -p "$OUTPUT_DIR"

for file in "$DATA_DIR"/*.wav; do
  base_name=$(basename "$file" .wav)
  whisper "$file" > "$OUTPUT_DIR/$base_name.txt"
done

