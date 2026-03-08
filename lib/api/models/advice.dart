import 'package:json_annotation/json_annotation.dart';

part 'advice.g.dart';

// @RealmModel()
@JsonSerializable()
class Advice {
  const Advice({
    required this.id,
    required this.advice,
    this.date,
    this.isFavorite,
  });

  factory Advice.fromJson(Map<String, dynamic> json) => _$AdviceFromJson(json);

  final int id;
  final String advice;
  final String? date;
  final bool? isFavorite;

  Map<String, dynamic> toJson() => _$AdviceToJson(this);

  @override
  String toString() {
    return 'Advice{id=$id, advice=$advice, date=$date}';
  }
}
