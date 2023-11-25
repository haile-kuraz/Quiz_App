import 'package:flutter/material.dart';

class SignInPainter extends CustomPainter {
  BuildContext context;
  SignInPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = Theme.of(context).colorScheme.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0013889, 0);
    path_0.lineTo(size.width * 0.9958333, size.height * 0.0006250);
    path_0.lineTo(size.width * 1.0018750, size.height * 0.4082125);
    path_0.quadraticBezierTo(size.width * 0.9543611, size.height * 0.5169250,
        size.width * 0.8021806, size.height * 0.5188813);
    path_0.cubicTo(
        size.width * 0.4762222,
        size.height * 0.5226188,
        size.width * 0.5487500,
        size.height * 0.5236812,
        size.width * 0.1859722,
        size.height * 0.5207750);
    path_0.quadraticBezierTo(size.width * 0.0184861, size.height * 0.5229438,
        size.width * -0.0023056, size.height * 0.6202000);
    path_0.lineTo(size.width * 0.0013889, 0);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    // Paint paint_stroke_0 = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.00
    //   ..strokeCap = StrokeCap.butt
    //   ..strokeJoin = StrokeJoin.miter;

    // canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LeaderBoard_shape extends CustomPainter {
  BuildContext context;
  LeaderBoard_shape({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3737500);
    path_0.lineTo(0, size.height * 0.0006250);
    path_0.lineTo(size.width * 0.9985714, size.height * 0.0012500);
    path_0.lineTo(size.width * 0.9985714, size.height * 0.3750000);
    path_0.quadraticBezierTo(size.width * 0.8203571, size.height * 0.2918750,
        size.width * 0.5014286, size.height * 0.2912500);
    path_0.quadraticBezierTo(size.width * 0.1735714, size.height * 0.2889062, 0,
        size.height * 0.3737500);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
