import 'package:flutter/material.dart';

abstract class GestureRepository {
  bool isGestureDetected({
    required List<Offset> points,
    required double ratio,
  });

  bool pinkyFingerVerify();
  bool ringFingerVerify();
  bool middleFingerVerify();
  bool indexFingerVerify();
  bool thumbFingerVerify();

  bool verifyGesture();
  String getGestureName();
  String getGestureDescription();

  String getGestureSound();
}