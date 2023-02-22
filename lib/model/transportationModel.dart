// To parse this JSON data, do
//
//     final transportationModel = transportationModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TransportationModel transportationModelFromJson(String str) =>
    TransportationModel.fromJson(json.decode(str));

String transportationModelToJson(TransportationModel data) =>
    json.encode(data.toJson());

class TransportationModel {
  TransportationModel({
    required this.transId,
    required this.categoryOfTrans,
    required this.noOfSeat,
    required this.status,
  });

  String transId;
  String categoryOfTrans;
  int noOfSeat;
  String status;

  factory TransportationModel.fromJson(Map<String, dynamic> json) =>
      TransportationModel(
        transId: json["transId"],
        categoryOfTrans: json["category_of_trans"],
        noOfSeat: json["no_of_seat"],
        status: json["status"],
      );
  factory TransportationModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      TransportationModel(
        transId: json["transId"],
        categoryOfTrans: json["category_of_trans"],
        noOfSeat: json["no_of_seat"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "transId": transId,
        "category_of_trans": categoryOfTrans,
        "no_of_seat": noOfSeat,
        "status": status,
      };
}
