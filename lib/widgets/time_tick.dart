import 'package:flutter/material.dart';

class TimeTick extends StatelessWidget {
  final seconds;
  const TimeTick({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '00:$seconds',
          style: const TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Text(
          'minutes remaining',
          style: TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
