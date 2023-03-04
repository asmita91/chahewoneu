import 'package:chahewoneu/Services/firebaseService.dart';
import 'package:chahewoneu/models/place.dart';
import 'package:chahewoneu/repositories/PlacesRepositories.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  FirebaseService.db = FakeFirebaseFirestore();
  final PlaceRepository placeRepository = PlaceRepository();

  group('PlaceRepository', () {
    test('editPlace should update a document in Firestore', () async {
      final docId = 'testId';
      final data = Place_Model(
        placeName: 'Test Name',
        imageUrl: 'Test URL',
        placeDescription: 'Test Description',
        placeId: '2',
        estimatedPrice: 4000,
        distanceFromCap: 2,
        imagepath: 'null',
      );
      await placeRepository.editPlace(data, docId);

      final snapshot =
          await FirebaseService.db.collection('places').doc(docId).get();
      final updatedData = Place_Model.fromJson(snapshot.data()!);

      expect(updatedData.placeName, equals(data.placeName));
      expect(updatedData.imageUrl, equals(data.imageUrl));
    });
  });
}
