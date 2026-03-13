import 'package:flutter/material.dart';

import 'flutter_landscape_video_camera.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandscapeCameraScreen(),
    );
  }
}