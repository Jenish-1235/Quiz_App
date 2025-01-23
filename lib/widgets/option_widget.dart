// lib/widgets/option_widget.dart
import 'package:flutter/material.dart';
import '../models/option.dart';

class OptionWidget extends StatelessWidget {
  final Option option;
  final bool isSelected;
  final bool isAnswered;
  final VoidCallback onTap;

  OptionWidget({
    required this.option,
    required this.isSelected,
    required this.isAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color optionColor = Colors.white;
    if (isAnswered) {
      if (isSelected) {
        optionColor = option.is_correct ? Colors.green[100]! : Colors.red[100]!;
      } else if (option.is_correct) {
        optionColor = Colors.green[50]!;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: optionColor,
          border: Border.all(
              color: isAnswered
                  ? (option.is_correct
                  ? Colors.green
                  : isSelected
                  ? Colors.red
                  : Colors.grey)
                  : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              isAnswered
                  ? (option.is_correct
                  ? Icons.check_circle
                  : isSelected
                  ? Icons.cancel
                  : Icons.circle_outlined)
                  : Icons.radio_button_unchecked,
              color: isAnswered
                  ? (option.is_correct
                  ? Colors.green
                  : isSelected
                  ? Colors.red
                  : Colors.grey)
                  : Colors.grey,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                option.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
