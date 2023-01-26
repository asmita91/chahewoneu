// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Place_Model placeModelFromJson(String str) => Place_Model.fromJson(json.decode(str));

String placeModelToJson(Place_Model data) => json.encode(data.toJson());

class Place_Model {
  Place_Model({
    required this.placeId,
    required this.placeName,
    required this.placeDescription,
    required this.estimatedPrice,
    required this.distanceFromCap,
    required this.imagepath,
    required this.imageUrl,
  });

  String? placeId;
  String? placeName;
  String? placeDescription;
  String? estimatedPrice;
  String? distanceFromCap;
  String? imagepath;
  String? imageUrl;

  factory Place_Model.fromJson(Map<String, dynamic> json) => Place_Model(
    placeId: json["placeId"],
    placeName: json["placeName"],
    placeDescription: json["placeDescription"],
    estimatedPrice: json["estimatedPrice"],
    distanceFromCap: json["distanceFromCap"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "placeId": placeId,
    "placeName": placeName,
    "placeDescription": placeDescription,
    "estimatedPrice": estimatedPrice,
    "distanceFromCap": distanceFromCap,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };
  factory Place_Model.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => Place_Model(
    placeId: json.id,
    placeName: json["placeName"],
    placeDescription: json["placeDescription"],
    estimatedPrice: json["estimatedPrice"],
    distanceFromCap: json["distanceFromCap"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );
}
