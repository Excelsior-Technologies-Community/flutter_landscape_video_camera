## 🎯 flutter_landscape_video_camera

flutter_landscape_video_camera is a reusable Flutter landscape video recording camera library that provides a ready-to-use full-screen camera UI with recording timer, zoom gesture, flash control and camera switching.

It helps developers quickly integrate video recording functionality without writing complex camera setup, permission handling or orientation management logic.

You can directly open a landscape camera screen and start recording videos inside any Flutter application.


---

## ✨ Feature Preview

-📱 Fullscreen landscape camera preview
-🔐 Automatic camera & microphone permission handling
 🔄 Front / Back camera switching
🔴 Video recording with live timer
🔍 Pinch to zoom gesture
⚡ Flash ON / OFF toggle
📂 Video file path callback
🔁 Reusable camera screen
🧱 Clean architecture (Controller + Widgets + Utils)
📦 Easy integration in any Flutter project

---


## 📦 Installation

Add dependency in your **pubspec.yaml**
```
dependencies:
  flutter_landscape_video_camera:
    path: ../flutter_landscape_video_camera
```

Then run:

```
flutter pub get
```

---

## 🎬 Preview



---

## 🗂 File Structure

```
flutter_landscape_video_camera/
│
├─ lib/
│   ├─ flutter_landscape_video_camera.dart
│   │   // Main export file (used by other apps)
│   │
│   ├─ src/
│   │     ├─ controller/
│   │     │    └─ landscape_camera_controller.dart
│   │     │        // Handles camera initialization, recording, zoom & flash
│   │     │
│   │     ├─ utils/
│   │     │    ├─ camera_permissions.dart
│   │     │    │    // Requests camera & microphone permission
│   │     │    │
│   │     │    ├─ orientation_helper.dart
│   │     │    │    // Locks screen orientation to landscape
│   │     │    │
│   │     │    └─ timer_helper.dart
│   │     │         // Formats recording duration timer
│   │     │
│   │     └─ widgets/
│   │          ├─ landscape_camera_screen.dart
│   │          │    // Main full screen camera UI
│   │          │
│   │          ├─ record_button.dart
│   │          │    // Recording start/stop button
│   │          │
│   │          └─ round_icon_button.dart
│   │               // Camera switch & flash buttons
│   │
│   └─ main.dart
│        // Example demo app using the library
│
├─ README.md
│   // Package documentation
│
├─ LICENSE
│   // MIT License
│
└─ pubspec.yaml
    // Package metadata and dependencies
```

---

## 🚀 How To Use

1️⃣ Import package

```
import 'package:flutter_landscape_video_camera/flutter_landscape_video_camera.dart';
```

2️⃣ Open Camera Screen

```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const LandscapeCameraScreen(),
  ),
);
```

3️⃣ Receive Recorded Video Path

```
controller.onVideoRecorded = (path) {
  print("Video saved at: $path");
};
```

---

## 🏠 Full Example

```
import 'package:flutter/material.dart';
import 'package:flutter_landscape_video_camera/flutter_landscape_video_camera.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Demo')),
      body: Center(
        child: ElevatedButton(
          child: const Text("Open Camera"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LandscapeCameraScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

---

## 🧾 Controller Properties

| Property        | Type                  | Description                      |
| --------------- | --------------------- | -------------------------------- |
| onVideoRecorded | Function(String path) | Returns recorded video file path |
| isRecording     | bool                  | Recording state                  |
| zoomLevel       | double                | Current zoom level               |
| recordSeconds   | int                   | Recording duration               |

---

## 📄 MIT LICENSE

```
MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files to deal in the Software
without restriction.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
```
