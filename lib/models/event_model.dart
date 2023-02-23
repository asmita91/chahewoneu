// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {

  EventModel({

    required this.eventId,
    required this.eventName,
    required this.eventDescription,
    required this.eventLocation,
    required this.imagepath,
    required this.imageUrl,

  });

  String eventId;
  String eventName;
  String eventDescription;
  String eventLocation;
  String imagepath;
  String imageUrl;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(

    eventId: json["event_Id"],
    eventName: json["EventName"],
    eventDescription: json["eventDescription"],
    eventLocation: json["eventLocation"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "event_Id": eventId,
    "EventName": eventName,
    "eventDescription": eventDescription,
    "eventLocation": eventLocation,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };
  factory EventModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => EventModel(
    eventId: json.id,
    eventName: json["EventName"],
    eventDescription: json["eventDescription"],
    eventLocation: json["eventLocation"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

}
