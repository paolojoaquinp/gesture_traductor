import 'dart:isolate';

import 'package:camera/camera.dart';

import '../helpers/isolate_utils.dart';
import '../../domain/repositories/ai_model.dart';
import '../repositories_impl/hands_repository_impl.dart';
import 'service_locator.dart';

enum Models {
  FaceDetection,
  FaceMesh,
  Hands,
  Pose,
}

class ModelInferenceService {
  late AiModel model;
  late Function handler;
  Map<String, dynamic>? inferenceResults;

  Future<Map<String, dynamic>?> inference({
    required IsolateUtils isolateUtils,
    required CameraImage cameraImage,
  }) async {
    final responsePort = ReceivePort();

    isolateUtils.sendMessage(
      handler: handler,
      params: {
        'cameraImage': cameraImage,
        'detectorAddress': model.getAddress,
      },
      sendPort: isolateUtils.sendPort,
      responsePort: responsePort,
    );

    inferenceResults = await responsePort.first;
    responsePort.close();
  }

  void setModelConfig(int index) {
    switch (Models.values[index]) {
      case Models.FaceDetection:
        model = locator<Hands>();
        handler = runHandDetector;
        break;
      case Models.FaceMesh:
        model = locator<Hands>();
        handler = runHandDetector;
        break;
      case Models.Hands:
        model = locator<Hands>();
        handler = runHandDetector;
        break;
      case Models.Pose:
        model = locator<Hands>();
        handler = runHandDetector;
        break;
    }
  }
}
