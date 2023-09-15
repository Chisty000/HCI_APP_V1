import 'package:flutter/material.dart';
import 'disdet.dart';
import './appointment.dart';
import './find_doctor.dart';
import 'package:audioplayers/audioplayers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressed = false;
  AudioPlayer? _player;

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    backgroundColor: const Color.fromARGB(169, 12, 191, 223),
    minimumSize: const Size(55, 88),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  void _incrementCounter() {
    pressed = !pressed;

    if (pressed) {
      final player = _player = AudioPlayer();
      player.play(AssetSource('audio.mp3'));
    } else {
      if (_player != null) {
        _player?.stop();
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      //Background section
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          image: DecorationImage(
              image: AssetImage("assets/images/bgimg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiseaseDetection()),
                  );
                },
                child: const Text(
                  '১ \n রোগ নির্নয়',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindDoctor()));
                },
                child: const Text(
                  '২ \n ডাক্তার খুজুন',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Appointment()));
                },
                child: const Text(
                  '৩ \n এপোয়েন্টমেন্ট',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'নিচের বাটনটি চেপে সহায়িকা চালু/বন্ধ করুন',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: !pressed
              ? const Icon(Icons.play_arrow)
              : const Icon(Icons.stop_rounded),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
