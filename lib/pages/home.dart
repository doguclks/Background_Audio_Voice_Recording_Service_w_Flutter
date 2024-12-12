import 'package:app/functions/record_functions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRecording = false;
  bool isPlaying = false;
  String? recordingPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Recorder"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show the play/stop button if a recording exists
            if (recordingPath != null)
              MaterialButton(
                onPressed: () {
                  setState(() {
                    if (isPlaying) {
                      audioPlayerPlay();
                      isPlaying = false;
                    } else {
                      audioPlayerPlay();
                      isPlaying = true;
                    }
                  });
                },
                color: Theme.of(context).colorScheme.primary,
                child: Text(
                  isPlaying
                      ? "Stop Playing Recording"
                      : "Start Playing Recording",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            else
              const Text("No recording found", style: TextStyle(fontSize: 16)),

            const SizedBox(height: 40),

            // Floating action button for recording
            FloatingActionButton(
              onPressed: () {
                if (isRecording) {
                  stopRecording();
                  setState(() {
                    isRecording = false;
                  });
                } else {
                  startRecording();
                  setState(() {
                    recordingPath =
                        "mock_path/recording.mp4"; // Update with real path after recording
                    isRecording = true;
                  });
                }
              },
              backgroundColor: isRecording
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
              child: Icon(
                isRecording ? Icons.stop : Icons.mic,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              isRecording ? "Recording..." : "Tap to record",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
