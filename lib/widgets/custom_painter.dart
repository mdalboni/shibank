import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.deepPurple[400];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    var paint2 = Paint();
    paint2.color = Colors.deepPurple[800];
    paint2.style = PaintingStyle.fill; // Change this to fill

    var paint3 = Paint();
    paint3.color = Colors.deepPurple[600];
    paint3.style = PaintingStyle.fill; // Change this to fill

    var path2 = Path();
    path2.moveTo(-size.width / 2, size.height * 0.25);
    path2.quadraticBezierTo(
        0, size.height / 2, size.width / 1.5, size.height * 0.25);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);

    var path3 = Path();
    path3.moveTo(size.width / 2, size.height * 0.25);
    path3.quadraticBezierTo(
        size.width, size.height / 2, size.width * 1.5, size.height * 0.25);
    path3.lineTo(size.width * 2, 0);
    path3.lineTo(0, 0);

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
