import 'package:chahewoneu/models/Hotel_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../repositories/hotel_repositories.dart';


class HotelViewModel with ChangeNotifier{
  HotelRepository _hotelRepository =HotelRepository();
  Stream<QuerySnapshot<HotelModel>>? _hotel;
  Stream<QuerySnapshot<HotelModel>>? get hotel => _hotel;

  Future<void> getHotel() async{
    var response = _hotelRepository.getData();
    _hotel = response;
    notifyListeners();
  }
}