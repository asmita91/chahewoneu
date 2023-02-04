// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../models/Hotel_Model.dart';
// import '../services/firebase_service.dart';
//
// class EventRepository{
//   CollectionReference<HotelModel> ref =
//   FirebaseService.db.collection("event")
//       .withConverter<HotelModel>(
//     fromFirestore: (snapshot, _) {
//       return HotelModel.fromFirebaseSnapshot(snapshot);
//     },
//     toFirestore: (model, _) => model.toJson(),
//   );
//   Stream<QuerySnapshot<HotelModel>> getData()  {
//     Stream<QuerySnapshot<HotelModel>> response = ref
//         .snapshots();
//     return response;
//   }
//   Future<HotelModel?> getOneData(String id) async {
//     DocumentSnapshot<HotelModel> response = await ref.doc(id).get();
//     return response.data();
//   }
//
//
//   Future<void> addHotel(HotelModel data) async {
//     await ref.add(data);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Hotel_Model.dart';
import '../models/event_model.dart';
import '../services/firebase_service.dart';

class EventRepository{
  CollectionReference<EventModel> ref =
  FirebaseService.db.collection("event")
      .withConverter<EventModel>(
    fromFirestore: (snapshot, _) {
      return EventModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<EventModel>> getData()  {
    Stream<QuerySnapshot<EventModel>> response = ref
        .snapshots();
    return response;
  }
  Future<EventModel?> getOneData(String id) async {
    DocumentSnapshot<EventModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<void> addEvent(EventModel data) async {
    await ref.add(data);
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Hotel_Model.dart';
import '../models/event_model.dart';
import '../services/firebase_service.dart';

class EventRepository{
  CollectionReference<EventModel> ref =
  FirebaseService.db.collection("event")
      .withConverter<EventModel>(
    fromFirestore: (snapshot, _) {
      return EventModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Stream<QuerySnapshot<EventModel>> getData()  {
    Stream<QuerySnapshot<EventModel>> response = ref
        .snapshots();
    return response;
  }
  Future<EventModel?> getOneData(String id) async {
    DocumentSnapshot<EventModel> response = await ref.doc(id).get();
    return response.data();
  }


  Future<void> addEvent(EventModel data) async {
    await ref.add(data);
  }
}