import 'package:json_annotation/json_annotation.dart';

part 'aeroplane_seat.g.dart';

@JsonSerializable()
class AeroplaneSeat {
  String? bookedDate;
  String? userId;
  String? bookingId;
  Map<String, List<int>>? seat;

  AeroplaneSeat(this.bookedDate, this.userId, this.seat, this.bookingId);

  factory AeroplaneSeat.fromJson(Map<String, dynamic> json) =>
      _$AeroplaneSeatFromJson(json);

  Map<String, dynamic> toJson() => _$AeroplaneSeatToJson(this);
}
