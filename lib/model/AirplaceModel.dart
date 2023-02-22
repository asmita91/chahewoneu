import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

AirplaneModel airplaneModelFromJson(String str) =>
    AirplaneModel.fromJson(json.decode(str));

String airplaneModelToJson(AirplaneModel data) => json.encode(data.toJson());

class AirplaneModel {
  AirplaneModel({
    required this.date,
    required this.left,
    required this.right,
  });

  String date;
  List<String?> left;
  List<String?> right;

  factory AirplaneModel.fromJson(Map<String, dynamic> json) => AirplaneModel(
        date: json["date"],
        left: List<String?>.from(json["left"].map((x) => x)),
        right: List<String?>.from(json["right"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "left": List<dynamic>.from(left.map((x) => x)),
        "right": List<dynamic>.from(right.map((x) => x)),
      };

  factory AirplaneModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      AirplaneModel(
        date: json["date"],
        left: List<String?>.from(json["left"].map((x) => x)),
        right: List<String?>.from(json["right"].map((x) => x)),
      );
}
