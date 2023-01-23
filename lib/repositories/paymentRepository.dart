import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/AdminPaymentModel.dart';
import '../services/firebase_service.dart';

class PaymentRepository {
  CollectionReference<AdminPaymentModel> ref =
      FirebaseService.db.collection("payment").withConverter<AdminPaymentModel>(
            //typecast garirakhnu naparos vanera banakoo reeeee
            fromFirestore: (snapshot, _) {
              return AdminPaymentModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Stream<QuerySnapshot<AdminPaymentModel>> getPayment() {
    Stream<QuerySnapshot<AdminPaymentModel>> response = ref.snapshots();
    return response;
  }

  Future<AdminPaymentModel?> getOneData(String id) async {
    DocumentSnapshot<AdminPaymentModel> response = await ref.doc(id).get();
    return response.data();
  }

  Future<AdminPaymentModel?> deletePayment(String id) async {
    await ref.doc(id).delete();
  }

  Future<bool> addPayment(AdminPaymentModel data) async {
    await ref.add(data);
    return true;
  }

  Future<void> editPayment(AdminPaymentModel data, String id) async {
    var response = await ref.doc(id).set(data);
    return response;
  }
}
