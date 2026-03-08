// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_advice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAdviceResponse _$SearchAdviceResponseFromJson(
  Map<String, dynamic> json,
) => SearchAdviceResponse(
  totalResults: json['total_results'] as String?,
  query: json['query'] as String?,
  message: json['message'] as Map<String, dynamic>?,
  slips: (json['slips'] as List<dynamic>?)
      ?.map((e) => Advice.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchAdviceResponseToJson(
  SearchAdviceResponse instance,
) => <String, dynamic>{
  'total_results': instance.totalResults,
  'query': instance.query,
  'slips': instance.slips,
  'message': instance.message,
};
