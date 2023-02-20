


// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

import 'package:chahewoneu/model/bus_seat.dart';

BusSeat _$AeroplaneSeatFromJson(Map<String, dynamic> json) =>
    BusSeat(
      json['bookedDate'] as String?,
      json['userId'] as String?,
      (json['seat'] as Map<String, dynamic>?)?.map(
            (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
    );

Map<String, dynamic> _$AeroplaneSeatToJson(BusSeat instance) =>
    <String, dynamic>{
      'bookedDate': instance.bookedDate,
      'userId': instance.userId,
      'seat': instance.seat,
    };
