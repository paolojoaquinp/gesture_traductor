import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/data.dart';
import '../../../../data/services/model_inference_service.dart';
import '../../../../data/services/service_locator.dart';
import '../../../../data/helpers/isolate_utils.dart';
import '../bloc/camera_bloc.dart';
import 'widget/model_camera_preview.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  late CameraDescription _cameraDescription;

  bool _isRun = false;
  bool _predicting = false;
  bool _draw = false;

  late IsolateUtils _isolateUtils;
  late ModelInferenceService _modelInferenceService;

  final player = AudioPlayer();

  @override
  void initState() {
    _modelInferenceService = locator<ModelInferenceService>();
    _initStateAsync();
    super.initState();
  }

  void _initStateAsync() async {
    _isolateUtils = IsolateUtils();
    await _isolateUtils.initIsolate();
    await _initCamera();
    _predicting = false;
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _cameraController = null;
    _isolateUtils.dispose();
    _modelInferenceService.inferenceResults = null;
    super.dispose();
  }

  // Observador: verifica cambios
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bloc = BlocProvider.of<CameraBloC>(context);
    bloc.setLabel('Neutral');
  }


  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraDescription = _cameras[1];
    _isRun = false;
    _onNewCameraSelected(_cameraDescription);
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _cameraController!.addListener(() {
      if (mounted) setState(() {});
      if (_cameraController!.value.hasError) {
        _showInSnackBar(
            'Camera error ${_cameraController!.value.errorDescription}');
      }
    });

    try {
      await _cameraController!.initialize().then((value) {
        if (!mounted) return;
      });
    } on CameraException catch (e) {
      _showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CameraBloC>(context);
    return Hero(
      tag:'model',
      child: WillPopScope(
        onWillPop: () async {
          _imageStreamToggle;
          Navigator.pop(context);
          return false;
        },
        // Interface
        child: Scaffold(
          backgroundColor: darkPurple,
          appBar: AppBar(title: Text(bloc.state)),
          body: ModelCameraPreview(
            cameraController: _cameraController,
            index: widget.index,
            draw: _draw,
          ),
          floatingActionButton: _buildFloatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  AppBar get _buildAppBar => AppBar(
        title: Text(
          models[widget.index]['title']!,
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(28),
              fontWeight: FontWeight.bold),
        ),
      );

  Container get _buildFloatingActionButton => Container(
    margin: EdgeInsets.only(
      bottom: ScreenUtil().setHeight(20.0),
      left: ScreenUtil().setWidth(20.0),
      right: ScreenUtil().setWidth(20.0),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: ScreenUtil().setWidth(20.0),
      vertical: ScreenUtil().setHeight(10.0),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10.0,
          offset: const Offset(0.0, 5.0),
        ),
      ],
    ),
    child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _cameraDirectionToggle,
              color: darkPurple,
              iconSize: ScreenUtil().setWidth(30.0),
              icon: const Icon(
                Icons.cameraswitch,
              ),
            ),
            TextButton(
              onPressed: () => _imageStreamToggle,
              child: Text(
                (_isRun) ? 'Detener' : 'Iniciar',
                style: TextStyle(
                  color: darkPurple,
                  fontSize: ScreenUtil().setSp(20.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
  );

  void get _imageStreamToggle {
    setState(() {
      _draw = !_draw;
    });

    _isRun = !_isRun;
    if (_isRun) {
      _cameraController!.startImageStream(
        (CameraImage cameraImage) async =>
            await _inference(cameraImage: cameraImage),
      );
    } else {
      _cameraController!.stopImageStream();
    }
  }

  void get _cameraDirectionToggle {
    setState(() {
      _draw = false;
    });
    _isRun = false;
    if (_cameraController!.description.lensDirection ==
        _cameras.first.lensDirection) {
      _onNewCameraSelected(_cameras.last);
    } else {
      _onNewCameraSelected(_cameras.first);
    }
  }

  Future<void> _inference({required CameraImage cameraImage}) async {
    if (!mounted) return;

    if (_modelInferenceService.model.interpreter != null) {
      if (_predicting || !_draw) {
        return;
      }

      setState(() {
        _predicting = true;
      });

      if (_draw) {
        await _modelInferenceService.inference(
          isolateUtils: _isolateUtils,
          cameraImage: cameraImage,
        );
      }

      if (mounted) {
        setState(() {
          _predicting = false;
        });
      }

    }
  }
}
