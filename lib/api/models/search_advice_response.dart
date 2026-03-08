import 'package:json_annotation/json_annotation.dart';
import 'advice.dart';

part 'search_advice_response.g.dart';

@JsonSerializable()
class SearchAdviceResponse {
  const SearchAdviceResponse({
    this.totalResults,
    this.query,
    this.message,
    required this.slips,
  });
  //{"message": {"type": "notice", "text": "No advice slips found matching that search term."}}
  factory SearchAdviceResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAdviceResponseFromJson(json);

  @JsonKey(name: 'total_results')
  final String? totalResults;

  final String? query;

  @JsonKey(name: 'slips')
  final List<Advice>? slips;
  // {"slips": [{...}, {...}]}

  @JsonKey(name: 'message')
  final Map<String, dynamic>? message; // {"slips": [{...}, {...}]}

  List<Advice> get adviceList => slips ?? [];

  Map<String, dynamic> toJson() => _$SearchAdviceResponseToJson(this);

  @override
  String toString() {
    return 'SearchAdviceResponse{totalResults=$totalResults, query=$query, slips=$slips}';
  }
}
