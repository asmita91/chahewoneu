import 'package:chahewoneu/model/transportationModel.dart';
import 'package:chahewoneu/repositories/transportationRepositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PlaceViewModel with ChangeNotifier {
  TransportationRepository _transportationRepository =
      TransportationRepository();
  Stream<QuerySnapshot<TransportationModel>>? _trans;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<TransportationModel>>? get trans => _trans;

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
    var response = _transportationRepository.getTransData();
    _trans = response;
    notifyListeners();
  }
}
