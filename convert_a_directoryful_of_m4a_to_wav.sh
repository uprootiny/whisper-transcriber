#!/bin/bash

DATA_DIR="data"
for file in "$DATA_DIR"/*.m4a; do
  base_name=$(basename "$file" .m4a)
  ffmpeg -i "$file" "$DATA_DIR/$base_name.wav"
done
