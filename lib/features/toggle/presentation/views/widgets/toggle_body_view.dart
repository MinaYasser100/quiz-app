import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';

class ToggleBodyView extends StatelessWidget {
  const ToggleBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage(
                    'assets/images/quiz-comic-pop-art-style_175838-505.avif'),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        Column(
          children: [
            CustomButtonWidget(
              onPressed: () {},
              text: 'Teacher',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              onPressed: () {},
              text: 'Student',
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ],
    );
  }
}
