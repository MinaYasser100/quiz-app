import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/styles/styles.dart';

class SplashBodyView extends StatefulWidget {
  const SplashBodyView({super.key});

  @override
  State<SplashBodyView> createState() => _SplashBodyViewState();
}

class _SplashBodyViewState extends State<SplashBodyView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubicEmphasized,
      ),
    );
    _colorAnimation = ColorTween(
      end: AppColor.secondColor,
      begin: Colors.grey,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            image: AssetImage(
                'assets/images/quiz-comic-pop-art-style_175838-505.avif'),
          ),
        ),
        const SizedBox(height: 20),
        SlideTransition(
          position: _offsetAnimation,
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Text(
                'Let\'s get started',
                style:
                    Styles.textStyle24.copyWith(color: _colorAnimation.value),
              );
            },
          ),
        ),
      ],
    );
  }
}
