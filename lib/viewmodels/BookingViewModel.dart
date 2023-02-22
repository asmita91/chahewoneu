import 'package:chahewoneu/models/Booking_Model.dart';
import 'package:chahewoneu/repositories/bookingRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class BookingViewModel with ChangeNotifier {
  BookingRepository _bookingRepository = BookingRepository();
  Stream<QuerySnapshot<BookingModel>>? _book;
  //_underscore rakheko variable aaru cls le use garna mildain a
  Stream<QuerySnapshot<BookingModel>>? get book => _book;

  Future<void> getPackage() async {
    var response = _bookingRepository.getData();
    _book = response;
    notifyListeners();
  }

  Future<void> deletePeople(String id) async {
    await _bookingRepository.deletePackage(id);
    notifyListeners();
  }
}
