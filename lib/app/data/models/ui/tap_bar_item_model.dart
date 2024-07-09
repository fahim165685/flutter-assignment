import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TapBarItemModel{
  final String? name;
  final String? icon;
  final Widget? tapBarView;
  final bool? isSelected;

  TapBarItemModel({this.name, this.icon, this.tapBarView, this.isSelected});

}