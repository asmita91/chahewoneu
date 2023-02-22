// To parse this JSON data, do
//
//     final carModel = carModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CarModel carModelFromJson(String str) => CarModel.fromJson(json.decode(str));

String carModelToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  CarModel({
    required this.userId,
    required this.userName,
    required this.status,
  });

  String userId;
  String userName;
  bool status;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        userId: json["userId"],
        userName: json["userName"],
        status: json["status"],
      );
  factory CarModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      CarModel(
        userId: json["userId"],
        userName: json["userName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "status": status,
      };
}
