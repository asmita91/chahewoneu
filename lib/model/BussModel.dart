import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

BusModel busModelFromJson(String str) =>
    BusModel.fromJson(json.decode(str));

String busModelToJson(BusModel data) => json.encode(data.toJson());

class BusModel {
  BusModel({
    required this.date,
    required this.left,
    required this.right,
  });

  String date;
  List<String?> left;
  List<String?> right;

  factory BusModel.fromJson(Map<String, dynamic> json) => BusModel(
    date: json["date"],
    left: List<String?>.from(json["left"].map((x) => x)),
    right: List<String?>.from(json["right"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "left": List<dynamic>.from(left.map((x) => x)),
    "right": List<dynamic>.from(right.map((x) => x)),
  };

  factory BusModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) =>
      BusModel(
        date: json["date"],
        left: List<String?>.from(json["left"].map((x) => x)),
        right: List<String?>.from(json["right"].map((x) => x)),
      );
}
