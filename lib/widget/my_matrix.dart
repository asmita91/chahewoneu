import 'package:flutter/material.dart';

class MyMatrix {
  static Matrix4 matrix = new Matrix4.identity();
  static var _currentPageValue = 0.0;
  static double _scaleFactor = 1; // show the 80% of original size
  static double _height = 220;

  static void setInitialPage(int index) {
    int currentPageValue = _currentPageValue.floor();
    int nextPageValue = _currentPageValue.floor() + 1;
    int previousPageValue = _currentPageValue.floor() - 1;

    if (index == currentPageValue) {
      setCurrentPage(index);
    } else if (index == nextPageValue) {
      setNextPage(index);
    } else if (index == previousPageValue) {
      setPreviousPage(index);
    } else {
      setDefaultPage();
    }
  }

  static void setCurrentPage(int index) {
    matrix = new Matrix4.identity();
    double currentValue = _currentPageValue - index;
    double remainingScaleFactor = 1 - _scaleFactor;
    var _currentScale = 1 - currentValue * remainingScaleFactor;
    var currTrans = _height * (1 - _currentScale) / 2;
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }

  static void setPreviousPage(int index) {
    double currentValue = _currentPageValue - index;
    double remainingScaleFactor = 1 - _scaleFactor;
    var _currentScale = 1 - currentValue * remainingScaleFactor;
    var currTrans = _height * (1 - _currentScale) / 2;
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1);
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }

  static void setNextPage(int index) {
    double currentValue = _currentPageValue - index;
    double remainingScaleFactor = 1 - _scaleFactor;
    var _currentScale =
        _scaleFactor + (currentValue + 1) * remainingScaleFactor;
    var currTrans = _height * (1 - _currentScale) / 2;
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1);
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }

  static void setDefaultPage() {
    double remainingScaleFactor = 1 - _scaleFactor;
    var _currentScale = 0.8;
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
      ..setTranslationRaw(0, _height * remainingScaleFactor / 2, 1);
  }
}
