import 'package:cloud_firestore/cloud_firestore.dart';

class Place_Model {
  // String userId;
  String placeId;
  String placeName;
  String placeDescription;
  int estimatedPrice;
  int distanceFromCap;
  String imagepath;
  String imageUrl;

  Place_Model({
    // required this.userId,
    required this.placeId,
    required this.placeName,
    required this.placeDescription,
    required this.estimatedPrice,
    required this.distanceFromCap,
    required this.imagepath,
    required this.imageUrl,
  });

  factory Place_Model.fromJson(Map<String, dynamic> json) => Place_Model(
        // userId: json["userId"],
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeDescription: json["placeDescription"],
        estimatedPrice: json["estimatedPrice"],
        distanceFromCap: json["distanceFromCap"],
        imagepath: json["imagepath"],
        imageUrl: json["imageUrl"],
      );
  factory Place_Model.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      Place_Model(
        // userId: json["userId"],
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeDescription: json["placeDescription"],
        estimatedPrice: json["estimatedPrice"],
        distanceFromCap: json["distanceFromCap"],
        imagepath: json["imagepath"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        // "userId": userId,
        "placeId": placeId,
        "placeName": placeName,
        "placeDescription": placeDescription,
        "estimatedPrice": estimatedPrice,
        "distanceFromCap": distanceFromCap,
        "imagepath": imagepath,
        "imageUrl": imageUrl,
      };
}
