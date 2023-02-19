import 'dart:math';

import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final pointCount = 8;
    final angle = pi * 2 / pointCount;

    // ベジェ曲線の制御点の座標を決定するためのオフセットをランダムに決定します。
    final rand = Random(1234);
    final offset = radius / 3;

    path.moveTo(center.dx + radius, center.dy);
    for (int i = 1; i <= pointCount; i++) {
      final dx = center.dx + radius * cos(i * angle);
      final dy = center.dy + radius * sin(i * angle);
      path.quadraticBezierTo(
        center.dx + (dx - center.dx) / 2 + offset * (rand.nextDouble() - 0.5),
        center.dy + (dy - center.dy) / 2 + offset * (rand.nextDouble() - 0.5),
        dx,
        dy,
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CloudPainter oldDelegate) => false;
}
