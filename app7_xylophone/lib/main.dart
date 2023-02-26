import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const SizerClass()));
}

class SizerClass extends StatelessWidget {
  const SizerClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) => const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void play(String noteName) async {
    final player = AudioPlayer();
    await player.play(AssetSource('$noteName.mp3'));
  }

  Expanded buildKey({required String fileName, required Color materialColor}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          play(fileName);
        },
        style: TextButton.styleFrom(
          backgroundColor: materialColor,
          foregroundColor: Colors.white,
        ),
        child: Text(fileName),
      ),
    );
  }

  Container genKey({required String fileName, required Color materialColor}) {
    return Container(
      width: 100.w,
      height: 6.h,
      margin: const EdgeInsets.all(0),
      child: TextButton(
        onPressed: () {
          play(fileName);
        },
        style: TextButton.styleFrom(
          backgroundColor: materialColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(fileName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                genKey(fileName: 'C3', materialColor: Colors.red),
                genKey(fileName: 'D3', materialColor: Colors.orange),
                genKey(fileName: 'E3', materialColor: Colors.indigo),
                genKey(fileName: 'F3', materialColor: Colors.green),
                genKey(fileName: 'G3', materialColor: Colors.grey),
                genKey(fileName: 'A4', materialColor: Colors.purple),
                genKey(fileName: 'B4', materialColor: Colors.pink),
                genKey(fileName: 'C4', materialColor: Colors.deepOrange),
                genKey(fileName: 'D4', materialColor: Colors.orangeAccent),
                genKey(fileName: 'E4', materialColor: Colors.indigoAccent),
                genKey(fileName: 'F4', materialColor: Colors.greenAccent),
                genKey(fileName: 'G4', materialColor: Colors.grey),
                genKey(fileName: 'A5', materialColor: Colors.purpleAccent),
                genKey(fileName: 'B5', materialColor: Colors.brown),
                genKey(fileName: 'C5', materialColor: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
