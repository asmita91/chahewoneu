
import 'package:chahewoneu/Services/firebaseService.dart';
import 'package:chahewoneu/models/place.dart';
import 'package:chahewoneu/repositories/PlacesRepositories.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main()async{
  FirebaseService.db=FakeFirebaseFirestore();
  final PlaceRepository placeRepository =PlaceRepository();
  test("create a place", () async{
    var response = await placeRepository
        .addPlace(
        Place_Model(
            placeId: "test hotelId",
            placeName: "test hotelName",
            placeDescription: "test description",
            estimatedPrice: 0000,
            distanceFromCap: 0000,
            imagepath: "test imagepath",
            imageUrl: "test imageUrl"
        )
    );
    expect(response, true);
  }
  );
}
