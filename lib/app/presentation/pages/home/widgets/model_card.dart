import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/colors.dart' as colors;
import '../../../../../constants/data.dart';
import '../../../../data/services/model_inference_service.dart';
import '../../../../data/services/service_locator.dart';
import '../../camera/view/camera_page.dart';

class ModelCard extends StatelessWidget {
  const ModelCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTapCamera(context),
      child: Hero(
        tag: 'model',
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.waving_hand, color: colors.primaryPurple, size: 50),
                ),
              ),
              Expanded(
                flex: 8,
                child: _ModelDescription(index: index),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onTapCamera(BuildContext context) {
    locator<ModelInferenceService>().setModelConfig(index);
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => CameraPage(index: index),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}

class _ModelDescription extends StatelessWidget {
  const _ModelDescription({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            models[index]['title']!,
            style: TextStyle(
              color: colors.darkPurple,
              fontSize: ScreenUtil().setSp(20.0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(8.0),
          ),
          Text(
            models[index]['text']!,
            style: TextStyle(
              color: colors.darkPurple,
              fontSize: ScreenUtil().setSp(12.0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
