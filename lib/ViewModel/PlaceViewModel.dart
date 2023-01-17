import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/PlacesModel.dart';
import '../repositories/PlacesRepositories.dart';

class PlaceViewModel with ChangeNotifier {
  PlaceRepository _placeRepository = PlaceRepository();
  Stream<QuerySnapshot<PlaceModel>>? _place;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<PlaceModel>>? get place => _place;

  Future<void> getPlace() async {
    var response = _placeRepository.getPlaceData();
    _place = response;
    notifyListeners();
  }
}
