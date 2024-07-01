import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/text_theme_method.dart';
import 'package:quiz_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: textThemeMethod(),
      ),
      home: const SpalshView(),
    );
  }
}
