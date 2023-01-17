import 'package:cloud_firestore/cloud_firestore.dart';

import '../Services/firebaseService.dart';
import '../models/PlacesModel.dart';

class PlaceRepository {
  CollectionReference<PlaceModel> ref =
      FirebaseService.db.collection("places").withConverter<PlaceModel>(
            //typecast garirakhnu naparos vanera banakoo reeeee
            fromFirestore: (snapshot, _) {
              return PlaceModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<PlaceModel>> getPlaceData() {
    Stream<QuerySnapshot<PlaceModel>> response = ref.snapshots();
    return response;
  }

  Future<PlaceModel?> getOnePlaceData(String id) async {
    DocumentSnapshot<PlaceModel> response = await ref.doc(id).get();
    return response.data();
  }

  Future<bool> addPlace(PlaceModel data) async {
    await ref.add(data);
    return true;
  }
}
