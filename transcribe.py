import whisper
import os

# Load the Whisper model
model = whisper.load_model("base")

def transcribe_audio(file_path):
    result = model.transcribe(file_path)
    return result["text"]

def transcribe_directory(directory):
    transcriptions = {}
    for filename in os.listdir(directory):
        if filename.endswith(".wav"):
            file_path = os.path.join(directory, filename)
            text = transcribe_audio(file_path)
            transcriptions[filename] = text
    return transcriptions

def save_transcriptions(transcriptions, output_file):
    with open(output_file, "w") as f:
        for file, text in transcriptions.items():
            f.write(f"Transcription for {file}:\n{text}\n\n")

# Specify the directory containing your voice memos
directory = "data"
transcriptions = transcribe_directory(directory)

# Save the transcriptions to a text file
save_transcriptions(transcriptions, "transcriptions.txt")

