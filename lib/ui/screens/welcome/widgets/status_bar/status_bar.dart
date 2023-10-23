import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';
import 'package:vibe_games/ui/shared/ext.dart';

class ParallelogramPainter extends CustomPainter {
  final Color fillColor;

  ParallelogramPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(28.7951, 0)
      ..lineTo(231.117, 0)
      ..lineTo(241.676, 0.867981)
      ..lineTo(246.902, 3.298)
      ..lineTo(248.158, 8.923)
      ..lineTo(246.258, 19.3156)
      ..lineTo(237.897, 57.5)
      ..lineTo(0.621337, 57.5)
      ..lineTo(9.74642, 15.8288)
      ..lineTo(11.9295, 7.13332)
      ..lineTo(14.792, 2.59881)
      ..lineTo(19.8339, 0.772505)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ParallelogramWithText extends StatelessWidget {
  final Color fillColor;
  final String text;
  const ParallelogramWithText({
    Key? key,
    required this.fillColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(251, 58),
      painter: ParallelogramPainter(fillColor: fillColor),
      child: Padding(
        padding: const EdgeInsets.only(
          // положение текста внутри подложки
          top: 14,
          left: 50,
        ),
        child: Row(
          children: [
            Text(
              '',
              style: TextStyle(
                color: AppColors.text[3],
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            9.w,
            Text(
              text,
              style: TextStyle(
                color: AppColors.text[1],
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
