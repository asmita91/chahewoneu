

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../Services/firebaseService.dart';
import '../model/HiaceeModel.dart';
import '../model/hiace_seat.dart';

class HiaceRepo with ChangeNotifier {
  // plane
  Future<Object> getFromDate(String date) async {
    // db query
    var hiace = await FirebaseService.db
        .collection("hiace")
        .where("date", isEqualTo: date)
        .get();

    if (hiace.docs.length > 0) {
      return hiace.docs[0];
    } else {
      var c_hiace = await FirebaseService.db.collection("hiace").add(
          HiaceModel(
              date: date,
              left: List.generate(26, (index) => null),
              right: List.generate(26, (index) => null)).toJson());
      return c_hiace.get();
    }
  }

  Future<void> sendBookingDetailsToFirebase(HiaceSeat seat) async {
    var students = await FirebaseService.db.collection('hiace');
    return students
        .add(
        {"date": seat.bookedDate, "userId": seat.userId, "seat": seat.seat})
        .then((value) => print("Seat has been booked"))
        .catchError((error) => print("Something went wrong"));
  }

  getAllBookingData() async {
    var seat;
    // db query
    var hiace = await FirebaseService.db.collection("hiace").get();

    if (hiace.docs.isNotEmpty) {
      for (var singleData in hiace.docs) {
        var myData = singleData.data();
        String bookedDate = myData["date"];
        seat = myData["seat"];
        String userId = myData["userId"];
      }
      return seat;
    }
    return seat;
  }
}
