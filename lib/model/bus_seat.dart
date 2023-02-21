


import 'package:json_annotation/json_annotation.dart';

part 'bus_seat.g.dart';

@JsonSerializable()
class BusSeat{
  String? bookedDate;
  String? userId;
  Map<String, List<int>>? seat;


  BusSeat(this.bookedDate, this.userId, this.seat);
  factory BusSeat.fromJson(Map<String,dynamic>json)=>_$BusSeatFromJson(json);

  Map<String,dynamic> toJson()=> _$BusSeatToJson(this);

}