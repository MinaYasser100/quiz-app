import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

class CustomRemoveQuestionButton extends StatelessWidget {
  const CustomRemoveQuestionButton({
    super.key,
    required this.index,
    this.onTap,
  });

  final int index;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -12,
      right: -12,
      child: GestureDetector(
        onTap: onTap,
        child: const CircleAvatar(
          radius: 24,
          backgroundColor: AppColor.secondColor,
          child: Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
