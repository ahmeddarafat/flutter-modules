import 'package:flutter/material.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            child: Container(
              color: Colors.yellow,
              child: CustomPaint(
                painter: FacePainter(),
                child: Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// create simple paint
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// create a simple face
class FacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    // left eye
    canvas.drawCircle(
      Offset(
        size.width * 0.25,
        size.height * 0.25,
      ),
      size.width * 0.1,
      paint,
    );

    // right eye
    canvas.drawCircle(
      Offset(
        size.width * 0.75,
        size.height * 0.25,
      ),
      size.width * 0.1,
      paint,
    );

    // mouth
    final mouthPath = Path();
    mouthPath.moveTo(size.width * 0.2, size.height * 0.7);
    mouthPath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.9,
      size.width * 0.8,
      size.height * 0.7,
    );
    canvas.drawPath(mouthPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
