import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/modules/timeline/timeline.dart';
import 'package:get/get.dart';

class TimelineView extends GetView<TimelineController> {
  const TimelineView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TimelineAppBar(),
      body: TimelineBody()
    );
  }
}
