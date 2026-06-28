// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  houseId: json['houseId'] as String,
  name: json['name'] as String,
  surfaceM2: (json['surfaceM2'] as num?)?.toDouble(),
  photoPath: json['photoPath'] as String?,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'houseId': instance.houseId,
  'name': instance.name,
  'surfaceM2': instance.surfaceM2,
  'photoPath': instance.photoPath,
  'description': instance.description,
  'createdAt': instance.createdAt.toIso8601String(),
};
