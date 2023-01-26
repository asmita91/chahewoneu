import 'package:chahewoneu/models/place.dart';
import 'package:flutter/material.dart';

class MyConstants {
  static Place_Model? holdNavigatePlaceDetails;

  static double myCurrentPageValue = 0.0;
  static double _scaleFactor = 0.8; // show the 80% of original size
  static Matrix4 matrix = new Matrix4.identity();
  static double _height = 220;

  static void setMatrix(int index) {
    int currentPageValue = myCurrentPageValue.floor();
    int previousPageValue = myCurrentPageValue.floor() - 1;
    int nextPageValue = myCurrentPageValue.floor() + 1;

    if (index == myCurrentPageValue.floor()) {
      setCurrentPage(index);
    } else if (index == myCurrentPageValue.floor() + 1) {
      setNextPage(index);
    } else if (index == myCurrentPageValue.floor() - 1) {
      setPreviousPage(index);
    } else {
      setDefaultPage();
    }
  }

  static void setCurrentPage(int index) {
    matrix = new Matrix4.identity();
    double currentValue = myCurrentPageValue - index;
    double remainingScaleFactor = 1 - _scaleFactor;
    var _currentScale = 1 - currentValue * remainingScaleFactor;
    var currTrans = _height * (1 - _currentScale) / 2;
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }

  static void setPreviousPage(int index) {
    double currentValue = myCurrentPageValue - index;
    double remainingScaleFactor = 1 - _scaleFactor;
    var _currentScale = 1 - currentValue * remainingScaleFactor;
    var currTrans = _height * (1 - _currentScale) / 2;
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1);
    matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }

  static void setNextPage(int index) {
    double currentValue = myCurrentPageValue - index;
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
