# Whisper Transcriber

This project provides a simple command-line interface and scripts for transcribing audio files using the Whisper model.

## Setup

### Prerequisites

- Python 3.7 or later
- `ffmpeg` installed (use `brew install ffmpeg` on macOS)

### Installation

1. Clone the repository:

```sh
git clone https://github.com/emily/whisper-transcriber.git
cd whisper-transcriber

2. Create and activate a virtual environment:
```sh
python3 -m venv whisper-env
source whisper-env/bin/activate
```
3. Install the required packages:
pip install torch torchvision torchaudio
pip install openai-whisper

## Usage:
ffmpeg -i memo.m4a memo.wav && whisper memo.wav
Batch Transcription

Place your audio files in the data directory.
Run the transcription script:
sh
Copy code
python transcribe.py
Automatic Transcription

Run the automatic transcription script:
sh
Copy code
./auto_transcribe.sh &
Place your audio files in the watch_dir directory.

