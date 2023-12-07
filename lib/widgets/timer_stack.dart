import 'package:flutter/material.dart';
import 'package:timer_app/widgets/clock_dial_painter.dart';
import 'package:timer_app/widgets/time_tick.dart';

class TimerStack extends StatelessWidget {
  final seconds, maxSeconds;
  const TimerStack(
      {super.key, required this.seconds, required this.maxSeconds});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Container(
              //width: 400,
              //height: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
          // White circle stacked on top
          SizedBox(
            width: 250,
            height: 250,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 220.0,
            width: 220.0,
            child: CircularProgressIndicator(
              value: seconds / maxSeconds,
              strokeWidth: 12,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            width: 220,
            height: 220,
            padding: const EdgeInsets.all(10.0),
            child: CustomPaint(
              painter: ClockDialPainter(clockText: ClockText.roman),
            ),
          ),
          Center(
              child: TimeTick(
            seconds: seconds,
          )),
        ],
      ),
    );
  }
}
