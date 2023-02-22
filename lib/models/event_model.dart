// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    required this.event,
    required this.eventDescription,
    required this.eventId,
  });

  String event;
  String eventDescription;
  String eventId;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    event: json["event "],
    eventDescription: json["event_description"],
    eventId: json["event_id"],
  );

  Map<String, dynamic> toJson() => {
    "event ": event,
    "event_description": eventDescription,
    "event_id": eventId,
  };
}
