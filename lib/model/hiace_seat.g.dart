// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiace_seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiaceSeat _$HiaceSeatFromJson(Map<String, dynamic> json) => HiaceSeat(
      json['bookedDate'] as String?,
      json['userId'] as String?,
      (json['seat'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
      json['bookingId'] as String?,
    );

Map<String, dynamic> _$HiaceSeatToJson(HiaceSeat instance) => <String, dynamic>{
      'bookedDate': instance.bookedDate,
      'userId': instance.userId,
      'bookingId': instance.bookingId,
      'seat': instance.seat,
    };
