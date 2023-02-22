import 'package:chahewoneu/models/Booking_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Services/firebaseService.dart';

class BookingRepository with ChangeNotifier {
  CollectionReference<BookingModel> bookRef =
      FirebaseService.db.collection("books").withConverter<BookingModel>(
            fromFirestore: (snapshot, _) {
              return BookingModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<BookingModel>> getData() {
    Stream<QuerySnapshot<BookingModel>> response = bookRef.snapshots();
    return response;
  }

  Future<void> deletePackage(String id) async {
    await bookRef.doc(id).delete();
  }

  Future<bool> addPackage(BookingModel data) async {
    await bookRef.add(data);
    return true;
  }
}
