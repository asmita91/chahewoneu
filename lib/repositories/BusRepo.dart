

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../Services/firebaseService.dart';
import '../model/BussModel.dart';
import '../model/bus_seat.dart';

class BusRepo with ChangeNotifier {
  // plane
  Future<Object> getFromDate(String date) async {
    // db query
    var bus = await FirebaseService.db
        .collection("bus")
        .where("date", isEqualTo: date)
        .get();

    if (bus.docs.length > 0) {
      return bus.docs[0];
    } else {
      var c_bus = await FirebaseService.db.collection("bus").add(
          BusModel(
              date: date,
              left: List.generate(26, (index) => null),
              center: List.generate(26, (index) => null),
              right: List.generate(26, (index) => null)).toJson());
      return c_bus.get();
    }
  }

  Future<void> sendBookingDetailsToFirebase(BusSeat seat) async {
    var students = await FirebaseService.db.collection('bus');
    return students
        .add(
        {"date": seat.bookedDate, "userId": seat.userId, "seat": seat.seat})
        .then((value) => print("Seat has been booked"))
        .catchError((error) => print("Something went wrong"));
  }

  getAllBookingData() async {
    var seat;
    // db query
    var bus = await FirebaseService.db.collection("bus").get();

    if (bus.docs.isNotEmpty) {
      for (var singleData in bus.docs) {
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
