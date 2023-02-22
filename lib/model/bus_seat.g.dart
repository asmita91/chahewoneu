// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusSeat _$BusSeatFromJson(Map<String, dynamic> json) => BusSeat(
      json['bookedDate'] as String?,
      json['userId'] as String?,
      (json['seat'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
      json['bookingId'] as String?,
    );

Map<String, dynamic> _$BusSeatToJson(BusSeat instance) => <String, dynamic>{
      'bookedDate': instance.bookedDate,
      'userId': instance.userId,
      'bookingId': instance.bookingId,
      'seat': instance.seat,
    };
