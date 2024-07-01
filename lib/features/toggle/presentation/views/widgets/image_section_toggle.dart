import 'package:flutter/material.dart';

class ImageSectionToggle extends StatelessWidget {
  const ImageSectionToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
