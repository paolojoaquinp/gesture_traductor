import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


double angle(
      Offset firstLandmark,
      Offset midLandmark,
      Offset lastLandmark
  ) {
      final radians =
          math.atan2(lastLandmark.dy - midLandmark.dy,
                    lastLandmark.dx - midLandmark.dx) -
            math.atan2(firstLandmark.dy - midLandmark.dy,
                    firstLandmark.dx - midLandmark.dx);
      double degrees = radians * 180.0 / math.pi;
      degrees = degrees.abs();
      if (degrees > 180.0) {
          degrees = 360.0 - degrees;
      }
      return degrees;
  }


Future<void> playAudio(String urlSound) async {
  final player = AudioPlayer();
  await player.play(AssetSource(urlSound));
}

