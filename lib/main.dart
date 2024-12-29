import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  void playSound(int soundNumber) async {
    await _audioPlayer.setSource(AssetSource('note$soundNumber.wav'));
    await _audioPlayer.resume(); // Start playing the audio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          createTextButton(1, Colors.purple),
          createTextButton(2, Colors.indigo),
          createTextButton(3, Colors.blue),
          createTextButton(4, Colors.green),
          createTextButton(5, Colors.yellow),
          createTextButton(6, Colors.orange),
          createTextButton(7, Colors.red),
        ]),
      ),
    );
  }

  Expanded createTextButton(int soundNumber, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity, 60), // Button size
          backgroundColor: color, // Background color
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Rounded corners
          ),
        ),
        onPressed: () => playSound(soundNumber),
        child: Text("click here"),
      ),
    );
  }
}
