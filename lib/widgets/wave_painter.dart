import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final colors = {
    0: Colors.green[800],
    1: Colors.deepPurple[800],
    2: Colors.deepPurple[600],
    3: Colors.green[600],
    4: Colors.green[600],
    5: Colors.deepOrange,
    6: Colors.green[800],
    7: Colors.deepPurple[800],
    8: Colors.deepPurple[600],
    9: Colors.green[600],
    10: Colors.green[600],
  };

  @override
  void paint(Canvas canvas, Size size) {
    // for (int i = 0; i < 100; i++) {
    //   final lines = generateLines(size.width.toInt(), size.height.toInt());
    //   print(lines);
    //
    //   Paint line = new Paint()
    //     ..color = colors.putIfAbsent(
    //       i,
    //       () {
    //         return colors[int.parse('$i'.substring('$i'.length - 1))];
    //       },
    //     )
    //     ..strokeCap = StrokeCap.round
    //     ..style = PaintingStyle.fill
    //     ..strokeWidth = random.integer(30, min: 10).toDouble();
    //   canvas.drawLine(lines[0], lines[1], line);
    // }
  }

  List<Offset> generateLines(int width, int height) {
    List<Offset> linhas = [];
    for (int i = 0; i < 2; i++) {
      final valueX = random.integer(width + 30, min: 0 - 150);
      final valueY = random.integer(height + 30, min: 0 - 30);
      linhas.add(Offset(valueX.toDouble(), valueY.toDouble()));
    }
    return linhas;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
