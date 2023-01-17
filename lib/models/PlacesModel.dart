// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PlaceModel? placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel? data) => json.encode(data!.toJson());

class PlaceModel {
  PlaceModel({
    this.placeId,
    this.placeName,
    this.placeDesc,
    this.estimatedPrice,
    this.distanceFromCap,
    this.imageUrl,
    this.imagePath,
  });

  String? placeId;
  String? placeName;
  String? placeDesc;
  int? estimatedPrice;
  int? distanceFromCap;
  String? imageUrl;
  String? imagePath;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeDesc: json["placeDesc"],
        estimatedPrice: json["estimatedPrice"],
        distanceFromCap: json["distanceFromCap"],
        imageUrl: json["imageUrl"],
        imagePath: json["imagePath"],
      );
  factory PlaceModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      PlaceModel(
        placeId: json["placeId"],
        placeName: json["placeName"],
        placeDesc: json["placeDesc"],
        estimatedPrice: json["estimatedPrice"],
        distanceFromCap: json["distanceFromCap"],
        imageUrl: json["imageUrl"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "placeId": placeId,
        "placeName": placeName,
        "placeDesc": placeDesc,
        "estimatedPrice": estimatedPrice,
        "distanceFromCap": distanceFromCap,
        "imageUrl": imageUrl,
        "imagePath": imagePath,
      };
}
