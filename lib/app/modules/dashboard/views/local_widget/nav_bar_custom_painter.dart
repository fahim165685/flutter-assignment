import 'package:flutter/material.dart';

import '../../../../app_pkg.dart';

class NavBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    path.moveTo(size.width*0.4986667,size.height*0.5066667);
    path.arcToPoint(Offset(size.width*0.5893333,size.height*0.05333333),radius: Radius.elliptical(size.width*0.09066667, size.height*0.4533333),rotation: 0 ,largeArc: false,clockwise: false);
    path.arcToPoint(Offset(size.width*0.5887200,0),radius: Radius.elliptical(size.width*0.09498667, size.height*0.4749333),rotation: 0 ,largeArc: false,clockwise: false);
    path.lineTo(size.width*0.9333333,0);
    path.arcToPoint(Offset(size.width,size.height*0.3333333),radius: Radius.elliptical(size.width*0.06666667, size.height*0.3333333),rotation: 0 ,largeArc: false,clockwise: true);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);
    path.lineTo(0,size.height*0.3333333);
    path.arcToPoint(Offset(size.width*0.06666667,0),radius: Radius.elliptical(size.width*0.06666667, size.height*0.3333333),rotation: 0 ,largeArc: false,clockwise: true);
    path.lineTo(size.width*0.4086133,0);
    path.arcToPoint(Offset(size.width*0.4080000,size.height*0.05333333),radius: Radius.elliptical(size.width*0.09498667, size.height*0.4749333),rotation: 0 ,largeArc: false,clockwise: false);
    path.arcToPoint(Offset(size.width*0.4986667,size.height*0.5066667),radius: Radius.elliptical(size.width*0.09066667, size.height*0.4533333),rotation: 0 ,largeArc: false,clockwise: false);
    path.close();

    canvas.drawShadow(path, ColorConstants.blackColor.withOpacity(0.6), 50, false);
    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = ColorConstants.backgroundColor;
    canvas.drawPath(path,paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}