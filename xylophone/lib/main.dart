import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:quiver/iterables.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final List<Color> colorList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  Expanded soundButton(int soundNum, Color buttonColor) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundNum.wav');
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var pair in zip([range(1, 8).toList(), colorList]))
                soundButton(pair[0], pair[1])
            ],
          ),
        ),
      ),
    );
  }
}
