// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aeroplane_seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AeroplaneSeat _$AeroplaneSeatFromJson(Map<String, dynamic> json) =>
    AeroplaneSeat(
      json['bookedDate'] as String?,
      json['userId'] as String?,
      (json['seat'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
      json['bookingId'] as String?,
    );

Map<String, dynamic> _$AeroplaneSeatToJson(AeroplaneSeat instance) =>
    <String, dynamic>{
      'bookedDate': instance.bookedDate,
      'userId': instance.userId,
      'bookingId': instance.bookingId,
      'seat': instance.seat,
    };
