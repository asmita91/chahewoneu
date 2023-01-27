// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/Place_Model.dart';
// import '../services/firebase_service.dart';
//
// class place_Repository{
//   CollectionReference<Place_Model> ref =
//   FirebaseService.db.collection("place")
//       .withConverter<Place_Model>(
//     fromFirestore: (snapshot, _) {
//       return Place_Model.fromFirebaseSnapshot(snapshot);
//     },
//     toFirestore: (model, _) => model.toJson(),
//   );
//   Stream<QuerySnapshot<Place_Model>> getData()  {
//     Stream<QuerySnapshot<Place_Model>> response = ref
//         .snapshots();
//     return response;
//   }
//   Future<Place_Model?> getOneData(String id) async {
//     DocumentSnapshot<Place_Model> response = await ref.doc(id).get();
//     return response.data();
//   }
//
//
//   Future<void> addHotel(Place_Model data) async {
//     await ref.add(data);
//   }
// }