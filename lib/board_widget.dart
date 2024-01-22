import 'package:flutter/material.dart';
import 'constants.dart';
import 'hexagon_widget.dart';
import 'hexagon.dart';
import 'board.dart';
import 'dart:math' as math;

class BoardWidget extends StatelessWidget {
  final Board board;

  const BoardWidget(this.board, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double hexagonHeightScreenWidthBased = (screenWidth - 10) / 11.5;
    double hexagonHeightScreenHeightBased = (screenHeight - 10) / 13.5;
    double hexagonHeight = math.min(hexagonHeightScreenWidthBased, hexagonHeightScreenHeightBased);
    double hexagonWidth = hexagonWidthToHeightRatio * hexagonHeight;

    // position of screen center
    Offset center = Offset(screenWidth / 2, screenHeight / 2);
    // direction of q axis (up)
    Offset qVector = Offset(0, -hexagonHeight);
    // direction or r axis (up and to the right)
    Offset rVector = Offset(0.75 * hexagonWidth, -0.5 * hexagonHeight);

    List<Widget> hexWidgets = [];

    // position the hexagons according to their coordinates
    for (Hexagon hex in board.hexagons)
    {
      Offset hexPosition = center + (rVector * hex.rCoord.toDouble()) + (qVector * hex.qCoord.toDouble());

      var positionedHex = Positioned(
        left: hexPosition.dx - hexagonWidth/2,
        top: hexPosition.dy - hexagonHeight/2,
        child: HexagonWidget(
          height: hexagonHeight,
          color: hex.color,
          paintingStyle: PaintingStyle.fill,
          text: '${hex.qCoord},${hex.rCoord}',
        ),
      );
      hexWidgets.add(positionedHex);
    }

    return Stack(
      children: hexWidgets,
    );
  }
}
