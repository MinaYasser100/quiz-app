import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/styles.dart';

import '../constant/app_color.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColor.primaryColor,
  });
  final String text;
  final void Function() onPressed;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: MaterialButton(
        hoverColor: AppColor.secondColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}
