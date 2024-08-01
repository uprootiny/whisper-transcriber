#!/usr/bin/env python

import sys
import whisper

def main():
    if len(sys.argv) != 2:
        print("Usage: whisper <audio_file>")
        sys.exit(1)
    
    audio_file = sys.argv[1]
    model = whisper.load_model("base")
    result = model.transcribe(audio_file)
    print(result["text"])

if __name__ == "__main__":
    main()

