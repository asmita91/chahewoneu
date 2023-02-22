import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

HiaceModel hiaceModelFromJson(String str) =>
    HiaceModel.fromJson(json.decode(str));

String hiaceModelToJson(HiaceModel data) => json.encode(data.toJson());

class HiaceModel {
  HiaceModel({
    required this.date,
    required this.left,
    required this.right,
  });

  String date;
  List<String?> left;
  List<String?> right;

  factory HiaceModel.fromJson(Map<String, dynamic> json) => HiaceModel(
    date: json["date"],
    left: List<String?>.from(json["left"].map((x) => x)),
    right: List<String?>.from(json["right"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "left": List<dynamic>.from(left.map((x) => x)),
    "right": List<dynamic>.from(right.map((x) => x)),


  };

  factory HiaceModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) =>
      HiaceModel(
        date: json["date"],
        left: List<String?>.from(json["left"].map((x) => x)),
        right: List<String?>.from(json["right"].map((x) => x)),
      );
}
