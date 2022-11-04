import 'dart:ui';

import 'package:flutter/material.dart';

class NavBarClipper extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    // path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.27, 0);
    // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.46, 0), radius: Radius.circular(30.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.52, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    // path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 15, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;



}