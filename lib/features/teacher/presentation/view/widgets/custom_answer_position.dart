import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

class CustomAnswerPosition extends StatelessWidget {
  const CustomAnswerPosition({
    super.key,
    this.isLast = false,
    required this.controller,
    this.isSelect = false,
    required this.onSelect,
  });
  final bool isLast;
  final TextEditingController controller;
  final bool isSelect;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                isSelect
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColor.secondColor,
              ),
              onPressed: onSelect,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        if (!isLast)
          Divider(
            color: Colors.grey[300],
          ),
      ],
    );
  }
}
