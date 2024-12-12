import 'dart:io';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

final AudioRecorder audioRecorder = AudioRecorder();
final AudioPlayer audioPlayer = AudioPlayer();
String? recordingPath;
Future<void> startRecording() async {
  if (await audioRecorder.hasPermission()) {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final String filePath = p.join(appDocumentsDir.path, "recording.wav");
    await audioRecorder.start(const RecordConfig(), path: filePath);
  }
}

Future<void> stopRecording() async {
  String? filePath = await audioRecorder.stop();
  if (filePath != null) {
    print("FilePath : $filePath");
    recordingPath = filePath;
  }
}

Future<void> audioPlayerPlay() async {
  if (audioPlayer.playing) {
    audioPlayer.stop();
  } else {
    await audioPlayer.setFilePath(recordingPath!);
    await audioPlayer.play();
  }
}
