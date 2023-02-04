import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';
import '../models/place.dart';

class PlaceRepository with ChangeNotifier {
  CollectionReference<PlaceModel> placeRef =
      FirebaseService.db.collection("places").withConverter<PlaceModel>(
            //typecast garirakhnu naparos vanera banakoo reeeee
            fromFirestore: (snapshot, _) {
              return PlaceModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<PlaceModel>> getPlaceData() {
    Stream<QuerySnapshot<PlaceModel>> response = placeRef.snapshots();
    return response;
  }

  Future<DocumentSnapshot<PlaceModel>> getOnePlace(String placeId) async {
    try {
      final response = await placeRef.doc(placeId).get();
      if (!response.exists) {
        throw Exception("Place doesnot exists");
      }
      return response;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<bool> addPlace(PlaceModel data) async {
    await placeRef.add(data);
    return true;
  }
}
