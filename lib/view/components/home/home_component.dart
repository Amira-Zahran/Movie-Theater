import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

import '../core/style.dart';

Widget customText(text,double? size){
  return Text(text, style: TextStyle(color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),);
}

appBar(text){
  return AppBar(
    backgroundColor: secondary,
    elevation: 0.0,
    title: Text(text),
    leading: const BackButton(color: Colors.white,),
    centerTitle: true,);
}

/*class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 5;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffea5d49);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 50.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class CurvePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}*/

////////////////////////////////////////////////

class SliderPainter extends CustomPainter{
  SliderPainter({required this.sliderColor});

 // final Offset dragPosition;
  final Color sliderColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..color = sliderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.moveTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);

    {
      Path path = Path();
      path.moveTo(size.width * 0.25, 60);
      path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 0);
      path = ArrowPath.make(path: path);
      canvas.drawPath(path, paint..color = primary);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}






