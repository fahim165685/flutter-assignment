import 'package:flutter/material.dart';
import 'dart:math';

class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final double lineWidth;
  final StrokeCap circularStrokeCap;
  final LinearGradient linearGradient;

  GradientCircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.linearGradient,
    this.circularStrokeCap =  StrokeCap.square,
    this.lineWidth = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final gradient = linearGradient;

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = circularStrokeCap;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundPaint);

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}