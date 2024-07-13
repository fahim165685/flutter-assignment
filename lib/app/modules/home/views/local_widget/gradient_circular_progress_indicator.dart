import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

import 'gradient_circular_progress_painter.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const GradientCircularProgressIndicator({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    final totalDuration = endDate.difference(startDate).inDays;
    final elapsedDuration = DateTime.now().difference(startDate).inDays;
    final progress = elapsedDuration / totalDuration;

    final now = DateTime.now();
    final remainingDuration = endDate.isAfter(now) ? endDate.difference(now) : Duration.zero;

    final remainingMonths = remainingDuration.inDays ~/ 30;
    final remainingDays = remainingDuration.inDays % 30;

    final remainingMonthsBangla = AppHelper.convertToBangla(remainingMonths.toString());
    final remainingDaysBangla = AppHelper.convertToBangla(remainingDays.toString());

    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(100, 100),
          painter: GradientCircularProgressPainter(
            progress: progress.clamp(0.0, 1.0),
            backgroundColor: ColorConstants.gray25Color,
            linearGradient: ColorConstants.primaryGradient,
            lineWidth: 12
          ),
        ),
        SizedBox(
          width: 82, child: Center(
            child: Text("$remainingMonthsBangla মাস $remainingDaysBangla দিন",
                style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }
}