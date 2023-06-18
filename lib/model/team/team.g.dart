// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      id: json['id'] as String?,
      title: json['title'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dateTime': instance.dateTime?.toIso8601String(),
      'description': instance.description,
    };
