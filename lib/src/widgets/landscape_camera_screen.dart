import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../controller/landscape_camera_controller.dart';
import '../utils/orientation_helper.dart';
import '../utils/camera_permissions.dart';
import '../utils/timer_helper.dart';
import 'record_button.dart';
import 'round_icon_button.dart';

class LandscapeCameraScreen extends StatefulWidget {
  const LandscapeCameraScreen({super.key});

  @override
  State<LandscapeCameraScreen> createState() =>
      _LandscapeCameraScreenState();
}

class _LandscapeCameraScreenState
    extends State<LandscapeCameraScreen> {

  final LandscapeCameraController controller =
  LandscapeCameraController();

  bool hasPermission = false;

  @override
  void initState() {
    super.initState();

    OrientationHelper.setLandscape();

    initCamera();
  }

  Future<void> initCamera() async {

    hasPermission = await CameraPermissions.request();

    if (hasPermission) {
      await controller.initializeCamera();

      controller.onVideoRecorded = (path) {
        debugPrint("VIDEO PATH: $path");
      };

      setState(() {});
    }
  }

  @override
  void dispose() {
    OrientationHelper.setPortrait();
    controller.disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (!hasPermission) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "Camera Permission Required",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: controller.isInitialized
          ? Stack(
        children: [

          GestureDetector(
            onScaleUpdate: (details) async {

              double zoom =
                  controller.zoomLevel * details.scale;

              if (zoom < 1) zoom = 1;
              if (zoom > 8) zoom = 8;

              await controller.setZoom(zoom);

              setState(() {});
            },
            child: SizedBox.expand(
              child: CameraPreview(
                  controller.cameraController!),
            ),
          ),

          if (controller.isRecording)
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    TimerHelper.format(
                        controller.recordSeconds),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 110,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [

                  RoundIconButton(
                    icon: Icons.cameraswitch,
                    onTap: () async {
                      await controller.switchCamera();
                      setState(() {});
                    },
                  ),

                  RecordButton(
                    isRecording: controller.isRecording,
                    onTap: () async {
                      await controller.recordVideo();
                      setState(() {});
                    },
                  ),

                  RoundIconButton(
                    icon: Icons.flash_on,
                    onTap: () async {
                      await controller.toggleFlash();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}