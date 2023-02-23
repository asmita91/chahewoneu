import 'package:chahewoneu/models/event_model.dart';
import 'package:chahewoneu/repositories/event_repository.dart';
import 'package:chahewoneu/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main()async{
  FirebaseService.db=FakeFirebaseFirestore();
  final EventRepository eventRepository =EventRepository();
  test("create a event", () async{
    var response = await eventRepository
        .addEvent(
        EventModel(
          eventName: "test event name",
          eventDescription: " test event description",
          eventLocation: "test event location",
          eventId: "01111",
          imagepath: "test path",
          imageUrl: "test url"
    )
    );
    expect(response, true);
  }
  );
  // test("get event snapshot", () async{
  //   var data = eventRepository.getData();
  //   expect(data.runtimeType,_DistinctStream<QuerySnapshot<EventModel>>>);
  // });
}

// import 'package:chahewoneu/Services/firebaseService.dart';
// import 'package:chahewoneu/models/event_model.dart';
// import 'package:chahewoneu/repositories/event_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() async{
//   FirebaseService.db=FakeFirebaseFirestore();
//   final EventRepository eventRepository =EventRepository();
//
//   test("Creat a product", () async{
//     var response = await eventRepository
//         .addEvent(
//         EventModel(
//           eventName: "test event name",
//           eventDescription: " test event description",
//           eventLocation: "test event location",
//           eventId: "01111",
//           imagepath: "test path",
//           imageUrl: "test url"
//         )
//     );
//     expect(response, true);
//   });
//   test("get product snapshot", () async{
//     var data = eventRepository.getData();
//     expect(data.runtimeType, Stream<QuerySnapshot<EventModel>>);
//   });
// }