import 'package:chahewoneu/model/aeroplane_seat.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';
import '../model/AirplaceModel.dart';

class AirplaneRepo with ChangeNotifier {
  // plane
  Future<Object> getFromDate(String date) async {
    // db query
    var airplanes = await FirebaseService.db
        .collection("airplanes")
        .where("date", isEqualTo: date)
        .get();

    if (airplanes.docs.length > 0) {
      return airplanes.docs[0];
    } else {
      var c_airplanes = await FirebaseService.db.collection("airplanes").add(
          AirplaneModel(
              date: date,
              left: List.generate(26, (index) => null),
              right: List.generate(26, (index) => null)).toJson());
      return c_airplanes.get();
    }
  }

  Future<void> sendBookingDetailsToFirebase(AeroplaneSeat seat) async {
    var students = await FirebaseService.db.collection('airplanes');
    return students
        .add({
          "date": seat.bookedDate,
          "userId": seat.userId,
          "seat": seat.seat,
          "bookingId": seat.bookingId
        })
        .then((value) => print("Seat has been booked"))
        .catchError((error) => print("Something went wrong"));
  }

  getAllBookingData() async {
    var seat;
    // db query
    var airplanes = await FirebaseService.db.collection("airplanes").get();

    if (airplanes.docs.isNotEmpty) {
      for (var singleData in airplanes.docs) {
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
