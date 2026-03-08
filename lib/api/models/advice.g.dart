// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advice _$AdviceFromJson(Map<String, dynamic> json) => Advice(
  id: (json['id'] as num).toInt(),
  advice: json['advice'] as String,
  date: json['date'] as String?,
);

Map<String, dynamic> _$AdviceToJson(Advice instance) => <String, dynamic>{
  'id': instance.id,
  'advice': instance.advice,
  'date': instance.date,
};
