import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel {
  String userId;
  String placeId;
  String placeName;
  String placeDescription;
  int estimatedPrice;
  int distanceFromCap;
  String imageUrl;

  PlaceModel({
    required this.userId,
    required this.placeId,
    required this.placeName,
    required this.placeDescription,
    required this.estimatedPrice,
    required this.distanceFromCap,
    required this.imageUrl,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        userId: json["userId"],
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeDescription: json["placeDescription"],
        estimatedPrice: json["estimatedPrice"],
        distanceFromCap: json["distanceFromCap"],
        imageUrl: json["imageUrl"],
      );
  factory PlaceModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      PlaceModel(
        userId: json["userId"],
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeDescription: json["placeDescription"],
        estimatedPrice: json["estimatedPrice"],
        distanceFromCap: json["distanceFromCap"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "placeId": placeId,
        "placeName": placeName,
        "placeDescription": placeDescription,
        "estimatedPrice": estimatedPrice,
        "distanceFromCap": distanceFromCap,
        "imageUrl": imageUrl,
      };
}
