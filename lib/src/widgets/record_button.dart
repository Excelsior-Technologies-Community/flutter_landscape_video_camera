import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {

  final VoidCallback onTap;
  final bool isRecording;

  const RecordButton({
    super.key,
    required this.onTap,
    required this.isRecording,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: isRecording ? Colors.red : Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}