import 'package:flutter/material.dart';

class SplashBodyView extends StatelessWidget {
  const SplashBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: AssetImage(
                'assets/images/quiz-comic-pop-art-style_175838-505.avif'),
          ),
        ),
      ],
    );
  }
}
