import 'package:flutter/material.dart';

class DisapearAnimator extends StatefulWidget {
  final Widget child;
  const DisapearAnimator({required this.child, Key? key}) : super(key: key);
  @override
  State<DisapearAnimator> createState() => _DisapearAnimatorState();
}

class _DisapearAnimatorState extends State<DisapearAnimator> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isVisible = false;
        });

        // через секунду восстанавливаем видимость виджета
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            setState(() {
              _isVisible = true;
            });
          }
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }
}
