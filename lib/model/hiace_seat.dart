import 'package:json_annotation/json_annotation.dart';

part 'hiace_seat.g.dart';

@JsonSerializable()
class HiaceSeat {
  String? bookedDate;
  String? userId;
  String? bookingId;
  Map<String, List<int>>? seat;

  HiaceSeat(this.bookedDate, this.userId, this.seat, this.bookingId);
  factory HiaceSeat.fromJson(Map<String, dynamic> json) =>
      _$HiaceSeatFromJson(json);
  Map<String, dynamic> toJson() => _$HiaceSeatToJson(this);
}
