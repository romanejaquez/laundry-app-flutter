import 'package:flutter/material.dart';

class ServiceStepAnimation extends StatefulWidget {

  final Widget childStep;
  const ServiceStepAnimation({
    super.key,
    required this.childStep  
  });

  @override
  State<ServiceStepAnimation> createState() => _ServiceStepAnimationState();
}

class _ServiceStepAnimationState extends State<ServiceStepAnimation> with SingleTickerProviderStateMixin {

  late AnimationController ctrl;

  @override 
  void initState() {
    super.initState();

    ctrl = AnimationController(vsync: this,
      duration: const Duration(milliseconds: 750)
    )..forward();
  }

  @override 
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0, end: 1
        ).animate(CurvedAnimation(parent: ctrl, curve: Curves.easeInOut)),
        child: widget.childStep
      )
    );
  }
}