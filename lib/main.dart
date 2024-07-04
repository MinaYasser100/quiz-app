import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/constant/constant.dart';
import 'package:quiz_app/core/func/custom_text_selection_theme.dart';
import 'package:quiz_app/core/styles/text_theme_method.dart';
import 'package:quiz_app/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<List<String>>(hiveQuizID);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: customTextSelectionTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
        textTheme: textThemeMethod(),
      ),
      home: const SpalshView(),
    );
  }
}
