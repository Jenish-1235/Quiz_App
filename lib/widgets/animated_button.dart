// lib/widgets/animated_button.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String animationPath;

  AnimatedButton({
    required this.label,
    required this.onPressed,
    required this.animationPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Positioned(
            right: 10,
            child: Lottie.asset(
              animationPath,
              height: 30,
              width: 30,
              repeat: false,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
