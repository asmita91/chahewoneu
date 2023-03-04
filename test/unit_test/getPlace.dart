import 'package:chahewoneu/Services/firebaseService.dart';
import 'package:chahewoneu/models/place.dart';
import 'package:chahewoneu/repositories/PlacesRepositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  FirebaseService.db = FakeFirebaseFirestore();
  final PlaceRepository placeRepository = PlaceRepository();

  group('PlaceRepository', () {
    test('getPlace should return a Stream<QuerySnapshot<PlaceModel>>',
        () async {
      final stream = await placeRepository.getPlaceData();
      expect(stream, isInstanceOf<Stream<QuerySnapshot<Place_Model>>>());
    });
  });
}
