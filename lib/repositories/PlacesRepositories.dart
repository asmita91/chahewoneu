import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';
import '../models/place.dart';

class PlaceRepository with ChangeNotifier {
  CollectionReference<Place_Model> placeRef =
      FirebaseService.db.collection("places").withConverter<Place_Model>(
            //typecast garirakhnu naparos vanera banakoo reeeee
            fromFirestore: (snapshot, _) {
              return Place_Model.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<Place_Model>> getPlaceData() {
    Stream<QuerySnapshot<Place_Model>> response = placeRef.snapshots();
    return response;
  }

  Future<DocumentSnapshot<Place_Model>> getOnePlace(String placeId) async {
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

  Future<bool> addPlace(Place_Model data) async {
    await placeRef.add(data);
    return true;
  }

  Future<void> editPlace(Place_Model data, String id) async {
    var response = await placeRef.doc(id).set(data);
    return response;
  }
}
