import 'dart:async';
import 'package:camera/camera.dart';

class LandscapeCameraController {

  CameraController? cameraController;
  List<CameraDescription>? cameras;

  bool isInitialized = false;
  bool isRecording = false;

  int selectedIndex = 0;

  Timer? timer;
  int recordSeconds = 0;

  Function(String path)? onVideoRecorded;

  double zoomLevel = 1.0;

  Future<void> initializeCamera() async {

    cameras = await availableCameras();

    cameraController = CameraController(
      cameras![selectedIndex],
      ResolutionPreset.high,
      enableAudio: true,
    );

    await cameraController!.initialize();

    isInitialized = true;
  }

  Future<void> switchCamera() async {

    selectedIndex = selectedIndex == 0 ? 1 : 0;

    await cameraController?.dispose();

    cameraController = CameraController(
      cameras![selectedIndex],
      ResolutionPreset.high,
      enableAudio: true,
    );

    await cameraController!.initialize();
  }

  Future<void> recordVideo() async {

    if (cameraController == null) return;

    if (cameraController!.value.isRecordingVideo) {

      final file = await cameraController!.stopVideoRecording();

      timer?.cancel();
      recordSeconds = 0;

      isRecording = false;

      if (onVideoRecorded != null) {
        onVideoRecorded!(file.path);
      }

    } else {

      await cameraController!.startVideoRecording();

      isRecording = true;

      startTimer();
    }
  }

  void startTimer() {

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      recordSeconds++;
    });
  }

  Future<void> setZoom(double zoom) async {

    zoomLevel = zoom;

    await cameraController?.setZoomLevel(zoomLevel);
  }

  Future<void> toggleFlash() async {

    if (cameraController == null) return;

    if (cameraController!.value.flashMode == FlashMode.off) {
      await cameraController!.setFlashMode(FlashMode.torch);
    } else {
      await cameraController!.setFlashMode(FlashMode.off);
    }
  }

  void disposeCamera() {
    timer?.cancel();
    cameraController?.dispose();
  }
}