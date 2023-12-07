import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_app/screens/second_page.dart';
import 'package:timer_app/widgets/button_widget.dart';
//import 'package:timer_app/widgets/clock_dial_painter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:timer_app/widgets/timer_stack.dart';

import 'package:timer_app/widgets/triple_dot.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const maxSeconds = 30;
  int seconds = maxSeconds;

  Timer? timer;

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          if (flag && seconds <= 5) {
            AudioPlayer().play(AssetSource('countdown_tick.mp3'));
          }

          seconds--;
        });
      } else {
        stopTimer(reset: false);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SecondPage(
              title: widget.title,
            ),
          ),
        );
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Text(
                widget.title,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TripleDot(),
              const Text(
                'Nom Nom:)',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const Text(
                'You have 10 minutes to eat before the pause.',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const Text(
                'Focus on eating slowly',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              TimerStack(seconds: seconds, maxSeconds: maxSeconds),
              //const SizedBox(height: 50),
              toggleSwitch(),
              Text(
                flag == true ? 'Sound on' : 'Sound off',
                style: const TextStyle(color: Colors.white),
              ),
              buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  bool flag = true;

  Widget toggleSwitch() {
    return Switch(
      // This bool value toggles the switch.
      value: flag,
      activeTrackColor: Colors.green,
      activeColor: Colors.white,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.

        setState(() {
          flag = value;
        });
      },
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = seconds == maxSeconds || seconds == 0;
    return isRunning || !isCompleted
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: isRunning ? 'PAUSE' : 'RESUME',
                onClicked: () {
                  if (isRunning) {
                    stopTimer(reset: false);
                  } else {
                    startTimer();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: "LET'S STOP I'M FULL NOW",
                onClicked: () {
                  stopTimer();
                },
              ),
            ],
          )
        : ButtonWidget(
            text: 'START',
            onClicked: () {
              startTimer();
            },
          );
  }
}
