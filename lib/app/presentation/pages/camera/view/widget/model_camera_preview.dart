import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_mediapipe_1/app/data/repositories_impl/closed_fist_repository_impl.dart';
import 'package:flutter_with_mediapipe_1/app/data/repositories_impl/i_love_you_repository_impl.dart';
import 'package:flutter_with_mediapipe_1/app/data/repositories_impl/peace_repository_impl.dart';
import 'package:flutter_with_mediapipe_1/app/data/repositories_impl/pointing_up_repository_impl.dart';
import 'package:flutter_with_mediapipe_1/app/data/repositories_impl/three_repository_impl.dart';
import 'package:flutter_with_mediapipe_1/app/data/repositories_impl/thumb_up_repository_impl.dart';
import 'package:flutter_with_mediapipe_1/app/presentation/pages/camera/bloc/camera_bloc.dart';

import '../../../../../data/services/model_inference_service.dart';
import '../../../../../data/services/service_locator.dart';
import '../../../../../data/helpers/hands_utils.dart' as utils;

import 'face_detection_painter.dart';
import 'face_mesh_painter.dart';
import 'hands_painter.dart';
import 'pose_painter.dart';



class ModelCameraPreview extends StatelessWidget {
  ModelCameraPreview({
    required this.cameraController,
    required this.index,
    required this.draw,
    Key? key,
  }) : super(key: key);

  final CameraController? cameraController;
  final int index;
  final bool draw;

  late final double _ratio;
  final Map<String, dynamic>? inferenceResults =
      locator<ModelInferenceService>().inferenceResults;

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final screenSize = MediaQuery.of(context).size;
    _ratio = screenSize.width / cameraController!.value.previewSize!.height;

    return Stack(
      children: [
        CameraPreview(cameraController!),
        Visibility(
          visible: draw,
          child: IndexedStack(
            index: index,
            children: [
              _drawBoundingBox,
              _drawLandmarks,
              _drawHands,
              _drawPose,
            ],
          ),
        ),
      ],
    );
  }

  Widget get _drawBoundingBox {
    final bbox = inferenceResults?['bbox'];
    return _ModelPainter(
      customPainter: FaceDetectionPainter(
        bbox: bbox ?? Rect.zero,
        ratio: _ratio,
      ),
    );
  }

  Widget get _drawLandmarks => _ModelPainter(
        customPainter: FaceMeshPainter(
          points: inferenceResults?['point'] ?? [],
          ratio: _ratio,
        ),
      );

  Widget get _drawHands => _ModelPainter(
        ratio: _ratio,
        customPainter: HandsPainter(
          points: inferenceResults?['point'] ?? [],
          ratio: _ratio,
        ),
      );

  Widget get _drawPose => _ModelPainter(
        customPainter: PosePainter(
          points: inferenceResults?['point'] ?? [],
          ratio: _ratio,
        ),
      );
}

class _ModelPainter extends StatefulWidget {
  _ModelPainter({
    required this.customPainter,
    this.ratio,
    Key? key,
  }) : super(key: key);
  final CustomPainter customPainter;
  final double? ratio;

  @override
  State<_ModelPainter> createState() => _ModelPainterState();
}

enum GestureType {
  thumbUp,
  closedFist,
  pointingUp,
  iLoveYou,
  peace,
}

class _ModelPainterState extends State<_ModelPainter> {
  Offset? p1;
  Offset? p2;
  Offset? p3;
  Offset? p4;
  Offset? p5;


  @override
  void didUpdateWidget(covariant _ModelPainter oldWidget) {
    if(widget.customPainter != oldWidget.customPainter && (widget.customPainter is HandsPainter)) {
      final points = (widget.customPainter as HandsPainter).points;
      // obtener el angulo de los 3 primeros offset
      if (points.length >= 3) {
        points.map((point) => point * widget.ratio!).toList();
        // verificar los gestos dentro de la carpeta repository impl con enum GestureType
        // Create a list of gesture repositories
        final gestureRepositories = [
          ThumbUpRepositoryImpl(points: points, ratio: widget.ratio!),
          ILoveYouRepositoryImpl(points: points, ratio: widget.ratio!),
          PeaceRepositoryImpl(points: points, ratio: widget.ratio!),
          PointingUpRepositoryImpl(points: points, ratio: widget.ratio!),
          ClosedFistRepositoryImpl(points: points, ratio: widget.ratio!),
          ThreeRepositoryImpl(points: points, ratio: widget.ratio!)
        ];

        // Verify each gesture using functional programming
        gestureRepositories.forEach((repository) {
          final bloc = BlocProvider.of<CameraBloC>(context);
          if (repository.verifyGesture()) {
            if(bloc.state != repository.getGestureName() ) {
              bloc.setLabel(repository.getGestureName());
              print(repository.getGestureName());
              if(bloc.state != 'Neutral') {
                utils.playAudio(repository.getGestureSound());
              }
            }
          }
        });
      }

    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: widget.customPainter,
    );
  }
}
