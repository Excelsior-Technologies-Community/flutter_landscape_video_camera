# 🎥 flutter_landscape_video_camera
'''
A reusable Flutter library that provides a **ready-to-use Landscape Video Recording Camera Screen** with timer, zoom gesture, flash control and camera switching.

This library helps developers integrate **video recording functionality quickly** without writing complex camera logic.
'''
--------------------

## 🚀 Library Introduction
'''
`flutter_landscape_video_camera` is a clean architecture based camera module.
'''
It automatically:
'''
✅ Locks device orientation to landscape
✅ Requests camera & microphone permissions
✅ Shows fullscreen camera preview
✅ Supports video recording with timer
✅ Supports pinch to zoom gesture
✅ Supports flash toggle
✅ Allows switching front / back camera
✅ Returns recorded video file path
'''

------------------------

## Preview:





------------------------

## 🎬 Feature Preview
'''
📱 Landscape Camera Screen
🔴 Recording Timer
🔍 Pinch to Zoom
⚡ Flash Toggle
🔄 Switch Camera
📂 Video File Callback
🔐 Permission Handling
🧱 Clean Architecture
'''

-----------

## 📁 File Structure
'''
lib/
│
├── src/
│   ├── controller/
│   │     └── landscape_camera_controller.dart
│   │
│   ├── utils/
│   │     ├── camera_permissions.dart
│   │     ├── orientation_helper.dart
│   │     └── timer_helper.dart
│   │
│   └── widgets/
│         ├── landscape_camera_screen.dart
│         ├── record_button.dart
│         └── round_icon_button.dart
│
└── flutter_landscape_video_camera.dart
'''

-------------------

## 📦 How to Use in Another Project

1️⃣ Add Dependency

If using locally:
'''
flutter_landscape_video_camera:
path: ../flutter_landscape_video_camera
'''

------------------

 2️⃣ Import Library
'''
import 'package:flutter_landscape_video_camera/flutter_landscape_video_camera.dart';
'''

------------

3️⃣ Open Camera Screen
'''
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => const LandscapeCameraScreen(),
),
);
'''

-------------------

## 🏠 How to Use in main.dart
'''
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
'''

--------------------

## ⚙️ Properties
'''
| Property        | Type                  | Description                      |
| --------------- | --------------------- | -------------------------------- |
| onVideoRecorded | Function(String path) | Returns recorded video file path |
| isRecording     | bool                  | Recording state                  |
| zoomLevel       | double                | Current zoom level               |
| recordSeconds   | int                   | Recording duration               |
'''

-------------------

## 📜 MIT License
'''
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files to deal in the Software
without restriction.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
'''

-------------------


