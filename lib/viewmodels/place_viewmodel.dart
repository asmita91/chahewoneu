import 'package:chahewoneu/models/Hotel_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/Place_Model.dart';
import '../repositories/Place_Repositories.dart';
import '../repositories/PlacesRepositories.dart';
import '../repositories/hotel_repositories.dart';


class PlaceView_Model with ChangeNotifier{
  place_Repository _place_repository =place_Repository();
  Stream<QuerySnapshot<Place_Model>>? _place;
  Stream<QuerySnapshot<Place_Model>>? get place => _place;

  Future<void> getHotel() async{
    var response = _place_repository.getData();
    _place = response;
    notifyListeners();
  }
}