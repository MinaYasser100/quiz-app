import 'package:flutter/material.dart';

class CustomRemoveQuestionButton extends StatelessWidget {
  const CustomRemoveQuestionButton({
    super.key,
    required this.index,
    this.onTap,
    required this.color,
  });

  final int index;
  final Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -12,
      right: -12,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: const Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
