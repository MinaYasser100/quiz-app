import 'package:flutter/material.dart';
import 'package:quiz_app/features/toggle/presentation/views/widgets/toggle_body_view.dart';

class ToggleView extends StatelessWidget {
  const ToggleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ToggleBodyView(),
    );
  }
}
