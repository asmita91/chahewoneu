import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Hotel_Model.dart';
import '../services/firebase_service.dart';

class EventRepository{
  CollectionReference<HotelModel> ref =
  FirebaseService.db.collection("event")
      .withConverter<HotelModel>(
    fromFirestore: (snapshot, _) {
      return HotelModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<HotelModel>> getData()  {
    Stream<QuerySnapshot<HotelModel>> response = ref
        .snapshots();
    return response;
  }
  Future<HotelModel?> getOneData(String id) async {
    DocumentSnapshot<HotelModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<void> addHotel(HotelModel data) async {
    await ref.add(data);
  }
}