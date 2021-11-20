// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockView extends StatelessWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: CustomPaint(
        child: Image(
          image: AssetImage('assets/images/desklamp.png'),
          width: 20,
          height: 20,
        ),
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = math.min(centerX, centerY);
    Rect rectGradient = Rect.fromCircle(
      center: center,
      radius: 102.5,
    );
    Rect rectThick = Rect.fromCircle(
      center: center,
      radius: 84,
    );

    // a fancy rainbow gradient

    final Gradient gradient = SweepGradient(
      startAngle: 0.0,
      endAngle: math.pi * 2,
      colors: <Color>[
        Color(0xffFE4A4A),
        Color(0xffC4BF23),
        Color(0xff13C1AC),
        Color(0xffC463FC),
        Color(0xffFE4A4A)
      ],
      stops: [
        0.0,
        0.25,
        0.5,
        0.75,
        1.0,
      ],
    );

    var fillerBrush = Paint()..color = Color(0xffFFAC00);
    var fillerBrush2 = Paint()..color = Color(0xff171C2A);
    var gradientBrush = Paint()
      ..shader = gradient.createShader(rectGradient)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;
    var thinBrush = Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    var thickBrush = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(center, radius - 110, fillerBrush);
    canvas.drawCircle(center, 102.5, gradientBrush);
    canvas.drawCircle(center, radius - 65, thinBrush);

    var bigOuterRadius = radius - 18;
    var bigInnerRadius = radius - 28;
    var smallOuterRadius = 85;
    var smallInnerRadius = 78;

    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + bigOuterRadius * math.cos(i * math.pi / 180);
      var y1 = centerY + bigOuterRadius * math.sin(i * math.pi / 180);

      var x2 = centerX + bigInnerRadius * math.cos(i * math.pi / 180);
      var y2 = centerX + bigInnerRadius * math.sin(i * math.pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), thinBrush);
    }
    for (double i = 0; i < 360; i += 30) {
      var x1 = centerX + bigOuterRadius * math.cos(i * math.pi / 180);
      var y1 = centerY + bigOuterRadius * math.sin(i * math.pi / 180);

      var x2 = centerX + bigInnerRadius * math.cos(i * math.pi / 180);
      var y2 = centerX + bigInnerRadius * math.sin(i * math.pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), thickBrush);
    }
    for (double i = 0; i < 360; i += 15) {
      var x1 = centerX + smallOuterRadius * math.cos(i * math.pi / 180);
      var y1 = centerY + smallOuterRadius * math.sin(i * math.pi / 180);

      var x2 = centerX + smallInnerRadius * math.cos(i * math.pi / 180);
      var y2 = centerX + smallInnerRadius * math.sin(i * math.pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), thinBrush);
    }

    canvas.drawArc(rectThick, 2 * math.pi * 13 / 24, 2 * math.pi * 7 / 24,
        false, thickBrush);

    var x3 = centerX + 102.5 * math.cos(45 * math.pi / 180);
    var y3 = centerY + 102.5 * math.sin(45 * math.pi / 180);
    var offsetCenter = Offset(x3, y3);

    canvas.drawCircle(offsetCenter, 35, fillerBrush2);
    canvas.drawCircle(offsetCenter, 30, fillerBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
