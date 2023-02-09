import 'package:chahewoneu/model/CarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';
import '../model/AirplaceModel.dart';

class CarRepository with ChangeNotifier {
  CollectionReference<CarModel> carRef =
      FirebaseService.db.collection("cars").withConverter<CarModel>(
            //typecast garirakhnu naparos vanera banakoo reeeee
            fromFirestore: (snapshot, _) {
              return CarModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<CarModel>> getCarData() {
    Stream<QuerySnapshot<CarModel>> response = carRef.snapshots();
    return response;
  }

  Future<DocumentSnapshot<CarModel>> getOneCar(String placeId) async {
    try {
      final response = await carRef.doc(placeId).get();

      if (!response.exists) {
        throw Exception("Car doesnot exists");
      }
      return response;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<void> deleteCar(String id) async {
    await carRef.doc(id).delete();
  }

  Future<bool> addCar(CarModel data) async {
    await carRef.add(data);
    return true;
  }

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
}
