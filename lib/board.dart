import 'package:flutter/material.dart';
import 'hexagon.dart';

class Board {

  late List<Hexagon> hexagons;

  Board() {
    hexagons = _generateHexagons();
  } 

  // This defines the shape of the board
  // each _HexGroup is a single column with one or more hexes
  // this method can define hexagonal grids of arbitrary shape,
  // with gaps etc. 
  final List<_HexGroup> _columns = [
    _HexGroup(-5, 0, 6),
    _HexGroup(-4, -1, 7),
    _HexGroup(-3, -2, 8),
    _HexGroup(-2, -3, 9),
    _HexGroup(-1, -4, 10),
    _HexGroup(0, -5, 11),
    _HexGroup(1, -5, 10),
    _HexGroup(2, -5, 9),
    _HexGroup(3, -5, 8),
    _HexGroup(4, -5, 7),
    _HexGroup(5, -5, 6),
    _HexGroup(-6, 10, 1),
  ];

  List<Hexagon> _generateHexagons() {
    List<Hexagon> allHexagons = [];
    for (_HexGroup hexGroup in _columns) {
      for (int j = 0; j < hexGroup.length; j++) {
        Color color = _getColorForHexagon(hexGroup, j);
        allHexagons.add(Hexagon(hexGroup.q0 + j, hexGroup.r, color));
      }
    }
    return allHexagons;
  }

  Color _getColorForHexagon(_HexGroup hexGroup, int j) {
    int colorIndex = ((hexGroup.q0 + j) % 3 - (hexGroup.r % 3)) % 3;
    switch (colorIndex) {
      case 0:
        return const Color.fromARGB(255, 45, 155, 45);
      case 1:
        return const Color.fromARGB(255, 30, 30, 155);
      case 2:
        return const Color.fromARGB(255, 83, 33, 10);
      default:
        return Colors.grey; // Fallback color
    }
  }
}



class _HexGroup {
  final int r; // the r coordinate of this hex group
  final int q0; // the q coordinate of the first hex in the group
  final int length; // the length of the group

  _HexGroup(this.r, this.q0, this.length);
}
