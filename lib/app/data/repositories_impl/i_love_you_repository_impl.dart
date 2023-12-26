import 'dart:ui';

import 'package:flutter_with_mediapipe_1/app/domain/repositories/gesture_repository.dart';
import '../helpers/hands_utils.dart' as utils;

class ILoveYouRepositoryImpl implements GestureRepository {
  List<Offset> points;
  double ratio;
  ILoveYouRepositoryImpl({
    required this.points,
    required this.ratio,
  });

  @override
  String getGestureDescription() {
    return 'Esta es la descripcion de un gesto ILoveYou';
  }

  @override
  String getGestureName() {
    return 'Te quiero';
  }

    @override
  bool thumbFingerVerify() {
    final sublist = points.sublist(0, 5).map((point) => point * ratio).toList();
    // calcular angulo entre los puntos 1,2,3 de 180 grados
    final p1 = sublist[0];
    final p2 = sublist[1];
    final p3 = sublist[2];
    final p4 = sublist[3];
    final p5 = sublist[4];
    final angle1 = utils.angle(p1, p2, p3);
    final angle2 = utils.angle(p2, p3, p4);
    final angle3 = utils.angle(p3, p4, p5);
    // verificar que los 3 angulos sean mayores a 170 grados
    if (angle1 < 170 && angle2 < 170) {
      return true;
    }
    return false;
  }


  @override
  bool indexFingerVerify() {
   List<Offset> sublist = [points[0], ...points.sublist(5, 9)].map((point) => point * ratio).toList();
    final p1 = sublist[0];
    final p2 = sublist[1];
    final p3 = sublist[2];
    final p4 = sublist[3];
    final p5 = sublist[4];
    final angle2 = utils.angle(p2, p3, p4);
    final angle3 = utils.angle(p3, p4, p5);
    if (angle2 > 160 && angle3 > 160) {
      return true;
    }
    return false;
  }

  @override
  bool middleFingerVerify() {
    List<Offset> sublist = [points[0], ...points.sublist(9, 13)]
                                        .map((point) => point * ratio)
                                        .toList();
    final p1 = sublist[0];
    final p2 = sublist[1];
    final p3 = sublist[2];
    final p4 = sublist[3];
    final p5 = sublist[4];
    final angle1 = utils.angle(p1, p3, p4);
    final angle2 = utils.angle(p2, p3, p4);
    if (angle1 < 90 && angle2 < 90) {
      return true;
    }
    return false;
  }

  @override
  bool isGestureDetected({required List<Offset> points, required double ratio}) {
    // TODO: implement isGestureDetected
    throw UnimplementedError();
  }

  @override
  bool ringFingerVerify() {
    List<Offset> sublist =  [points[0], ...points.sublist(13, 17)]
            .map((point) => point * ratio)
            .toList();
    final p1 = sublist[0];
    final p2 = sublist[1];
    final p3 = sublist[2];
    final p4 = sublist[3];
    final p5 = sublist[4];
    final angle1 = utils.angle(p1, p3, p4);
    final angle2 = utils.angle(p2, p3, p4);
    if (angle1 < 45 && angle2 < 90) {
      return true;
    }
    return false;
  }

  @override
  bool pinkyFingerVerify() {
    List<Offset> sublist = [points[0], ...points.sublist(17, 21)]
            .map((point) => point * ratio)
            .toList();
    final p1 = sublist[0];
    final p2 = sublist[1];
    final p3 = sublist[2];
    final p4 = sublist[3];
    final p5 = sublist[4];
    final angle2 = utils.angle(p2, p3, p4);
    final angle3 = utils.angle(p3, p4, p5);
    if (angle2 > 160 && angle3 > 160) {
      return true;
    }
    return false;
  }
  
  @override
  bool verifyGesture() {
    return thumbFingerVerify() && indexFingerVerify() && middleFingerVerify() && ringFingerVerify() && pinkyFingerVerify();
  }
  
  @override
  String getGestureSound() {
    return 'sounds/i_love_you.wav';
  }
}