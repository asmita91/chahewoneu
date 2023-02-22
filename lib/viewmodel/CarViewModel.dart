import 'package:chahewoneu/model/CarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../repositories/CarRepository.dart';

class CarViewModel with ChangeNotifier {
  CarRepository _carRepository = CarRepository();
  Stream<QuerySnapshot<CarModel>>? _car;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<CarModel>>? get car => _car;

  Future<void> getCar() async {
    var response = _carRepository.getCarData();
    _car = response;
    notifyListeners();
  }

  Future<void> deleteCar(String id) async {
    await _carRepository.deleteCar(id);
    notifyListeners();
  }
}
