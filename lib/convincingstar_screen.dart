import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';

class BackgroundAudioPlayerScreen extends StatefulWidget {
  @override
  _BackgroundAudioPlayerScreenState createState() => _BackgroundAudioPlayerScreenState();
}

class _BackgroundAudioPlayerScreenState extends State<BackgroundAudioPlayerScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initializeAudioPlayer();
  }

  Future<void> _initializeAudioPlayer() async {
    _audioPlayer = AudioPlayer();

    // Enable background mode
    await FlutterBackground.initialize();
    await FlutterBackground.enableBackgroundExecution();

    // Load audio and set to loop
    await _audioPlayer.setSource(AssetSource('convince.mpeg'));
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  void _playAudio() async {
    await _audioPlayer.resume();
   
  }

  void _pauseAudio() async {
    await _audioPlayer.pause();
   
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
   
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    FlutterBackground.disableBackgroundExecution();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background Audio Player"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _playAudio,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text("Play"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pauseAudio,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text("Pause"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _stopAudio,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
