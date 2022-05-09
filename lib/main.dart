import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.red,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              soundColor(1, Colors.red, 'Note 1'),
              soundColor(2, Colors.orange, 'Note 2'),
              soundColor(3, Colors.yellow, 'Note 3'),
              soundColor(4, Colors.green, 'Note 4'),
              soundColor(5, Colors.blue, 'Note 5'),
              soundColor(6, Colors.indigo, 'Note 6'),
              soundColor(7, const Color(0xff8F00FF), 'Note 7'),
            ],
          ),
        ),
      ),
    );
  }

  Expanded soundColor(int num, color, String note) {
    int soundNumber = num;
    String noteNumber = note;

    void playSound() {
      final player = AudioCache();
      player.play('note$soundNumber.wav');
    }

    return Expanded(
      child: TextButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        onPressed: () {
          playSound();
        },
        child: Text(
          noteNumber,
          style: const TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
    );
  }
}
