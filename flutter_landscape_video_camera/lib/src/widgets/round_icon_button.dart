import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onTap;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}