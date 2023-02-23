import 'package:chahewoneu/models/Hotel_Model.dart';
import 'package:chahewoneu/models/event_model.dart';
import 'package:chahewoneu/repositories/event_repository.dart';
import 'package:chahewoneu/repositories/hotel_repositories.dart';
import 'package:chahewoneu/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main()async{
  FirebaseService.db=FakeFirebaseFirestore();
  final HotelRepository eventRepository =HotelRepository();
  test("create a hotel", () async{
    var response = await eventRepository
        .addHotel(
      HotelModel(
        hotelId: "test hotelId",
        hotelName: "test hotelName",
        description: "test description",
        price: "test price",
        location: "test location",
        imagepath: "test imagepath",
        imageUrl: "test imageUrl"
      )
    );
    expect(response, true);
  }
  );
}
