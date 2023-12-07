import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({super.key, required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 168, 248, 209),
          //padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16)
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
