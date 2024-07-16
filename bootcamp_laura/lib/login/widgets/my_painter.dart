import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(colors: [Colors.purple, Colors.pink.withOpacity(0.7)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.8, 1.0]);
    
    final paint= Paint()
    ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.05, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.08, size.height * 0.9, size.width * 0.5, size.height * 0.9)
      ..lineTo(size.width * 0.75, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.9, size.width * 0.9, size.height)
      ..lineTo(size.width * 0.85, size.height )
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}