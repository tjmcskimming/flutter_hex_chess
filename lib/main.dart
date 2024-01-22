import 'package:flutter/material.dart';
import 'board_widget.dart';
import 'board.dart';

void main() {
  runApp(HexagonApp());
}

class HexagonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        // Create an instance of Board and pass it to BoardWidget
        body: BoardWidget(Board()),
      ),
    );
  }
}
