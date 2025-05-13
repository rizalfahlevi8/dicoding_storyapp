import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:story_app/screen/components/loader_animation_widget.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> with TickerProviderStateMixin {
  late AnimationController loaderController;
  late Animation<double> loaderAnimation;

  @override
  void initState() {
    super.initState();
    loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    loaderAnimation = Tween(
      begin: 1.0,
      end: 1.4,
    ).animate(CurvedAnimation(parent: loaderController, curve: Curves.easeIn));
    loaderController.repeat(reverse: true);
  }

  @override
  void dispose() {
    loaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: loaderAnimation,
      child: Container(width: 300, height: 300),
      builder: (context, child) {
        return Transform.rotate(
          angle: loaderController.status == AnimationStatus.forward
              ? (math.pi * 2) * loaderController.value
              : -(math.pi * 2) * loaderController.value,
          child: CustomPaint(
            foregroundPainter: LoaderAnimationWidget(
              radiusRatio: loaderAnimation.value,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
