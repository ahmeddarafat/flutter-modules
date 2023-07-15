import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.cameraController});
  final CameraController cameraController;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  _getImages() {
    widget.cameraController.startImageStream((CameraImage image) {
      log(image.toString());
    });

  }

  @override
  void initState() {
    super.initState();
    _getImages();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.cameraController.value.isInitialized) {
      return Container();
    }
    return GestureDetector(
        onTap: () {
         widget.cameraController.stopImageStream();
          Navigator.pop(context);
        },
        child: CameraPreview(widget.cameraController));
  }
}
