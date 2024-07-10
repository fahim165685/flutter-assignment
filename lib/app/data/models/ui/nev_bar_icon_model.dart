import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NevBarIconModel {
  final String icon;
  final String? selectedIcon;
  final Widget page;
  final Bindings? binding;

  NevBarIconModel({
    required this.icon,
    this.selectedIcon,
    required this.page,
    this.binding,
  });

}
