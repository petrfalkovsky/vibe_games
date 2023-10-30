import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';

String _defaultFormatValue(double value, int? fixed) {
  if (fixed != null) {
    return value.toStringAsFixed(fixed);
  } else {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 2);
  }
}

class AnimatedProgressBar3 extends StatefulWidget {
  final double currentValue;
  final double maxValue;
  final double width;
  final double height;
  final Duration animatedDuration;
  final Axis direction;
  final VerticalDirection verticalDirection;
  final BorderRadiusGeometry _borderRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final Color progressColor;
  final int? changeColorValue;
  final Color changeProgressColor;
  final String Function(double value, int? fixed) formatValue;
  final int? formatValueFixed;
  final String? displayText;
  final TextStyle displayTextStyle;
  final Gradient? progressGradient;
  final Widget? icon;
  final Widget? text;
  final Widget? frontContent;
  final BoxBorder? progressBarBorder;
  final Widget? optionalField;

  AnimatedProgressBar3({
    Key? key,
    this.currentValue = 0,
    this.maxValue = 100,
    this.width = 200,
    this.height = 20,
    this.animatedDuration = const Duration(milliseconds: 300),
    this.direction = Axis.horizontal,
    this.verticalDirection = VerticalDirection.down,
    BorderRadiusGeometry? borderRadius,
    this.border,
    this.backgroundColor = const Color(0x00FFFFFF),
    this.progressColor = const Color(0xFFFA7268),
    this.changeColorValue,
    this.changeProgressColor = const Color(0xFF5F4B8B),
    this.formatValue = _defaultFormatValue,
    this.formatValueFixed,
    this.displayText,
    this.displayTextStyle =
        const TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
    this.progressGradient,
    this.icon,
    this.text,
    this.frontContent,
    this.progressBarBorder,
    this.optionalField,
  })  : _borderRadius = borderRadius ?? BorderRadius.circular(8),
        super(key: key);

  @override
  State<AnimatedProgressBar3> createState() => _AnimatedProgressBar3State();
}

class _AnimatedProgressBar3State extends State<AnimatedProgressBar3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: widget.animatedDuration, vsync: this);
    _animation =
        Tween<double>(begin: 0, end: widget.currentValue).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.forward(from: 0);
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressBar3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentValue != oldWidget.currentValue) {
      _controller.reset();
      _animation =
          Tween<double>(begin: 0, end: widget.currentValue).animate(_controller)
            ..addListener(() {
              setState(() {});
            });
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color progressColor = widget.progressColor;

    if (widget.changeColorValue != null) {
      final colorTween = ColorTween(
        begin: widget.progressColor,
        end: widget.changeProgressColor,
      );

      progressColor = colorTween.transform(_animation.value / widget.maxValue)!;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          // основной контейнер для анимированной полосы прогресса.
          Container(
            transform: Matrix4.skewX(-0.2),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: widget._borderRadius,
              border: widget.border,
            ),
            child: Stack(
              children: [
                Flex(
                  direction: widget.direction,
                  verticalDirection: widget.verticalDirection,
                  children: <Widget>[
                    Expanded(
                      flex: (_animation.value / widget.maxValue * 100).toInt(),
                      child: Stack(
                        children: [
                          // прогрессбар контейнер, который двигается
                          Container(
                            height: widget.height,
                            decoration: widget.currentValue == 0
                                ? const BoxDecoration()
                                : BoxDecoration(
                                    color: widget.progressGradient != null
                                        ? null
                                        : progressColor,
                                    gradient: widget.progressGradient,
                                    borderRadius: widget._borderRadius,
                                    border: widget.progressBarBorder,
                                  ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: sdpPX(context, 120)),
                              child: Row(
                                children: [
                                  FutureBuilder<bool>(
                                    future: Future.delayed(
                                        const Duration(milliseconds: 80),
                                        () => widget.currentValue != 0),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data == true) {
                                        return widget.optionalField ??
                                            const SizedBox();
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // иконка, если есть
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: sdpPX(context, 25),
                              ),
                              child: widget.icon,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 100 -
                          (_animation.value / widget.maxValue * 100).toInt(),
                      child: Container(),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // контейнер для отображения переднего контента
          Positioned(
            child: widget.frontContent ?? Container(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
