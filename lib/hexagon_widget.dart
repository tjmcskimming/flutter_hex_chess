import 'package:flutter/material.dart';
import 'constants.dart';

class HexagonWidget extends StatelessWidget {
  final double height;
  final Color color;
  final PaintingStyle paintingStyle;
  final String text; // New field for text

  HexagonWidget({
    Key? key,
    required this.height,
    required this.color,
    this.paintingStyle = PaintingStyle.fill,
    this.text = '', // Default to empty string
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: hexagonWidthToHeightRatio * height, // Assuming a fixed width-to-height ratio
      height: height,
      child: Stack(
        alignment: Alignment.center, // Align text to the center of the hexagon
        children: [
          CustomPaint(
            painter: _HexagonPainter(color: color, paintingStyle: paintingStyle),
            size: Size(hexagonWidthToHeightRatio * height, height),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14, 
              ),
          ), 
        ],
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final PaintingStyle paintingStyle;

  _HexagonPainter({this.color = Colors.blue, this.strokeWidth = 1.0, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    final path = Path();

    // Calculate the width and height of the hexagon based on the size of the canvas
    //final double height = size.height;
    //final double width = 0.5 * sqrt_3 * height;
    final double width = size.width;
    final double height = size.height;
    final double centerX = width / 2;
    final double centerY = height / 2;

    // Start the path for the hexagon
    path.moveTo(centerX - width / 2, centerY);
    path.lineTo(centerX - width / 4, centerY + height / 2);
    path.lineTo(centerX + width / 4, centerY + height / 2);
    path.lineTo(centerX + width / 2, centerY);
    path.lineTo(centerX + width / 4, centerY - height / 2);
    path.lineTo(centerX - width / 4, centerY - height / 2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
