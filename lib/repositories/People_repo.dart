import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';
import '../models/People_Model.dart';

class PeopleRepository with ChangeNotifier {
  CollectionReference<PeopleModel> pepRef =
      FirebaseService.db.collection("peoples").withConverter<PeopleModel>(
            //typecast garirakhnu naparos vanera banakoo reeeee
            fromFirestore: (snapshot, _) {
              return PeopleModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<PeopleModel>> getData() {
    Stream<QuerySnapshot<PeopleModel>> response = pepRef.snapshots();
    return response;
  }

  Future<void> deletePeople(String id) async {
    await pepRef.doc(id).delete();
  }

  Future<bool> addPeople(PeopleModel data) async {
    await pepRef.add(data);
    return true;
  }
}
