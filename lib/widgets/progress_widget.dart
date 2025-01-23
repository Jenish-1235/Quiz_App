// lib/widgets/progress_widget.dart
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int current;
  final int total;

  ProgressWidget({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    double progress = current / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question $current of $total',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          color: Colors.blueAccent,
          minHeight: 10,
        ),
      ],
    );
  }
}
