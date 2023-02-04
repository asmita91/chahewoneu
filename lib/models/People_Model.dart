// To parse this JSON data, do
//
//     final peopleModel = peopleModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PeopleModel peopleModelFromJson(String str) =>
    PeopleModel.fromJson(json.decode(str));

String peopleModelToJson(PeopleModel data) => json.encode(data.toJson());

class PeopleModel {
  PeopleModel({
    required this.userId,
    required this.number,
    required this.userName,
  });

  String userId;
  int number;
  String userName;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        userId: json["userId"],
        number: json["number"],
        userName: json["userName"],
      );
  factory PeopleModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      PeopleModel(
        userId: json["userId"],
        number: json["number"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "number": number,
        "userName": userName,
      };
}
