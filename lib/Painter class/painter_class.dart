import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle extends CustomPainter{
  final painter = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.stroke
  ..strokeWidth = 2;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawCircle(Offset(72, 77), 70, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}