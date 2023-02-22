import 'package:chahewoneu/model/transportationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';

class TransportationRepository with ChangeNotifier {
  CollectionReference<TransportationModel> transRef = FirebaseService.db
      .collection("transportation")
      .withConverter<TransportationModel>(
        //typecast garirakhnu naparos vanera banakoo reeeee
        fromFirestore: (snapshot, _) {
          return TransportationModel.fromFirebaseSnapshot(snapshot);
        },
        toFirestore: (model, _) => model.toJson(),
      );

  Stream<QuerySnapshot<TransportationModel>> getTransData() {
    Stream<QuerySnapshot<TransportationModel>> response = transRef.snapshots();
    return response;
  }

  Future<DocumentSnapshot<TransportationModel>> getOneTrans(
      String placeId) async {
    try {
      final response = await transRef.doc(placeId).get();

      if (!response.exists) {
        throw Exception("Transportation doesnot exists");
      }
      return response;
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future<bool> addTrans(TransportationModel data) async {
    await transRef.add(data);
    return true;
  }
}
