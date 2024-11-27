import 'dart:async';
import 'package:flutter/material.dart';

class ColorStream {
  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }

  final List<Color> colors = [
    Colors.pinkAccent,
    Colors.deepOrange,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.deepPurple,
  ];
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  close() {
    controller.close();
  }

  addError() {
    controller.sink.addError('Error');
  }
}
