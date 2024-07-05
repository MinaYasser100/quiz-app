import 'package:flutter/material.dart';
import 'package:quiz_app/features/splash/presentation/views/widget/splash_body_view.dart';

class SpalshView extends StatelessWidget {
  const SpalshView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashBodyView(),
    );
  }
}
