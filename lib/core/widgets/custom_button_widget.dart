import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/styles.dart';

import '../constant/app_color.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 50,
      width: 200,
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
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
