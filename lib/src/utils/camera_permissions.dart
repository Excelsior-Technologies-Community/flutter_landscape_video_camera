import 'package:permission_handler/permission_handler.dart';

class CameraPermissions {

  static Future<bool> request() async {

    var camera = await Permission.camera.request();
    var mic = await Permission.microphone.request();

    return camera.isGranted && mic.isGranted;
  }
}