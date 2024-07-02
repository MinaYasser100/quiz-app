import 'package:flutter/material.dart';

class CustomAnswerPosition extends StatelessWidget {
  const CustomAnswerPosition({
    super.key,
    this.isLast = false,
  });
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.add_box_outlined),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
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
