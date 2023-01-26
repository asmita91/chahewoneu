import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/place.dart';
import '../repositories/PlacesRepositories.dart';

class PlaceViewModel with ChangeNotifier {
  PlaceRepository _placeRepository = PlaceRepository();
  Stream<QuerySnapshot<Place_Model>>? _place;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<Place_Model>>? get place => _place;

  // Future<void> getOnePlace(String placeId) async {
  //   _place = PlaceModel();
  //   notifyListeners();
  //   try {
  //     var response = await _placeRepository.getOnePlace(placeId);
  //     _place = response.data();
  //     notifyListeners();
  //   } catch (e) {
  //     _place = null;
  //     notifyListeners();
  //   }
  // }
  Future<void> getPlace() async {
    var response = _placeRepository.getPlaceData();
    _place = response;
    notifyListeners();
  }
}
