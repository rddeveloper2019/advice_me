// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_advice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleAdviceResponse _$SingleAdviceResponseFromJson(
  Map<String, dynamic> json,
) => SingleAdviceResponse(
  slip: Advice.fromJson(json['slip'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SingleAdviceResponseToJson(
  SingleAdviceResponse instance,
) => <String, dynamic>{'slip': instance.slip};
