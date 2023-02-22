
part of 'aeroplane_seat.dart';

AeroplaneSeat _$AeroplaneSeatFromJson(Map<String, dynamic> json) =>
    AeroplaneSeat(
      json['bookedDate'] as String?,
      json['userId'] as String?,
      (json['seat'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
    );

Map<String, dynamic> _$AeroplaneSeatToJson(AeroplaneSeat instance) =>
    <String, dynamic>{
      'bookedDate': instance.bookedDate,
      'userId': instance.userId,
      'seat': instance.seat,
    };
