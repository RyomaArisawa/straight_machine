import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String _text01 = "おめでとうございます";
  final String _text02 = "合格です";
  final String _text03 = "よくできました";
  final String _text04 = "残念でした";
  final String _text05 = "不合格です";
  final String _text06 = "頑張りましょう";

  final List<String> _soundPaths = [
    "assets/sounds/sound1.mp3",
    "assets/sounds/sound2.mp3",
    "assets/sounds/sound3.mp3",
    "assets/sounds/sound4.mp3",
    "assets/sounds/sound5.mp3",
    "assets/sounds/sound6.mp3",
  ];

  final List<AudioPlayer> _audioPlayers = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];


  @override
  void dispose() {
    for (var audioPlayer in _audioPlayers) {
      audioPlayer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(
                      _text01,
                      0,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(
                      _text02,
                      1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(
                      _text03,
                      2,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(
                      _text04,
                      3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(
                      _text05,
                      4,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(
                      _text06,
                      5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _playSound(index),
        child: Text(displayText),
      ),
    );
  }

  _playSound(int index) async {
    await _audioPlayers[index].setAsset(_soundPaths[index]);
    _audioPlayers[index].play();
  }
}
