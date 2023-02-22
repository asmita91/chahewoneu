
part of 'hiace_seat.dart';


HiaceSeat _$HiaceSeatFromJson(Map<String, dynamic> json) => HiaceSeat(
      json['bookedDate'] as String?,
      json['userId'] as String?,
      (json['seat'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as int).toList()),
      ),
    );

Map<String, dynamic> _$HiaceSeatToJson(HiaceSeat instance) => <String, dynamic>{
      'bookedDate': instance.bookedDate,
      'userId': instance.userId,
      'seat': instance.seat,
    };
