import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/toggle/presentation/views/toggle_view.dart';

class CustomBackToToggleView extends StatelessWidget {
  const CustomBackToToggleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonWidget(
          text: 'Back',
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ToggleView(),
              ),
              (route) => false,
            );
          },
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
