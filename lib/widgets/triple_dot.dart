import 'package:flutter/material.dart';

class TripleDot extends StatelessWidget {
  const TripleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 8,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 8,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 8,
          ),
        ),
      ],
    );
  }
}
