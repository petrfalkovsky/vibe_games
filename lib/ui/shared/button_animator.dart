import 'package:flutter/material.dart';

class ButtonAnimator extends StatefulWidget {
  Widget childWidget;
  Function? onTap;
  ButtonAnimator({required this.childWidget, this.onTap, super.key});

  @override
  ButtonAnimatorState createState() => ButtonAnimatorState();
}

class ButtonAnimatorState extends State<ButtonAnimator> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    if (widget.onTap != null) {
      return GestureDetector(
        onTap: () {
          widget.onTap!();
        },
        child: Listener(
            onPointerDown: _handlePointerDown,
            onPointerUp: _handlePointerUp,
            child: Center(
              child: AnimatedScale(
                scale: _scale,
                curve: Curves.easeInOutCirc,
                duration: const Duration(milliseconds: 150),
                child: widget.childWidget,
              ),
            )),
      );
    } else {
      return Listener(
          onPointerDown: _handlePointerDown,
          onPointerUp: _handlePointerUp,
          child: Center(
            child: AnimatedScale(
              scale: _scale,
              curve: Curves.easeInOutCirc,
              duration: const Duration(milliseconds: 150),
              child: widget.childWidget,
            ),
          ));
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (this.mounted) {
      setState(() {
        _scale = 0.9;
      });
    }
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (this.mounted) {
      setState(() {
        _scale = 1.0;
      });
    }
  }
}
