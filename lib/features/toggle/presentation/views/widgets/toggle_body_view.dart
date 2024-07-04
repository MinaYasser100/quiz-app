import 'package:flutter/material.dart';

import 'buttons_section_toggle.dart';
import 'image_section_toggle.dart';

class ToggleBodyView extends StatelessWidget {
  const ToggleBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImageSectionToggle(),
          ButtonsSectionToggle(),
        ],
      ),
    );
  }
}
