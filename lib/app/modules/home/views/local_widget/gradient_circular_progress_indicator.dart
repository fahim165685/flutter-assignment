import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const GradientCircularProgressIndicator({super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    final totalDuration = endDate.difference(startDate).inDays;
    final elapsedDuration = DateTime.now().difference(startDate).inDays;
    final progress = elapsedDuration / totalDuration;

    // Calculate remaining time
    final now = DateTime.now();
    final remainingDuration = endDate.isAfter(now) ? endDate.difference(now) : Duration.zero;

    // Convert remaining time to months and days
    final remainingMonths = remainingDuration.inDays ~/ 30;
    final remainingDays = remainingDuration.inDays % 30;

    // Convert numbers to Bangla
    final remainingMonthsBangla = AppHelper.convertToBangla(remainingMonths.toString());
    final remainingDaysBangla = AppHelper.convertToBangla(remainingDays.toString());

    return CircularPercentIndicator(
      radius: 55, lineWidth: 12,
      percent: progress.clamp(0.0, 1.0),
      center:  Text("$remainingMonthsBangla মাস $remainingDaysBangla দিন",
          style: Get.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
      backgroundColor: ColorConstants.gray25Color,

      circularStrokeCap: CircularStrokeCap.square,
      linearGradient: ColorConstants.primaryGradient,
    );
  }
}