// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    required this.date,
    required this.userId,
    required this.placeId,
    required this.people,
  });

  String date;
  String userId;
  String placeId;
  num people;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        date: json["date"],
        userId: json["user_id"],
        placeId: json["place_id"],
        people: json["people"],
      );
  factory BookingModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      BookingModel(
        date: json["date"],
        userId: json["user_id"],
        placeId: json["place_id"],
        people: json["people"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "user_id": userId,
        "place_id": placeId,
        "people": people,
      };
}
