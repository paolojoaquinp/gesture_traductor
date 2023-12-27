import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_with_mediapipe_1/constants/colors.dart';

class HandsPainter extends CustomPainter {
  final List<Offset> points;
  final double ratio;

  HandsPainter({
    required this.points,
    required this.ratio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isNotEmpty) {
      var pointPaint = Paint()
        ..color = darkPurple
        ..strokeWidth = 8;

      var linePaint = Paint()
        ..color = Colors.green
        ..strokeWidth = 2;

      canvas.drawPoints(
        PointMode.points,
        points.map((point) => point * ratio).toList(),
        pointPaint,
      );

      canvas.drawPoints(
        PointMode.polygon,
        points.sublist(0, 5).map((point) => point * ratio).toList(),
        linePaint,
      );
      canvas.drawPoints(
        PointMode.polygon,
        [points[0], ...points.sublist(5, 9)]
            .map((point) => point * ratio)
            .toList(),
        linePaint,
      );
      canvas.drawPoints(
        PointMode.polygon,
        [points[0], ...points.sublist(9, 13)]
            .map((point) => point * ratio)
            .toList(),
        linePaint,
      );
      canvas.drawPoints(
        PointMode.polygon,
        [points[0], ...points.sublist(13, 17)]
            .map((point) => point * ratio)
            .toList(),
        linePaint,
      );
      canvas.drawPoints(
        PointMode.polygon,
        [points[0], ...points.sublist(17, 21)]
            .map((point) => point * ratio)
            .toList(),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
