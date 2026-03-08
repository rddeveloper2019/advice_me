import 'package:json_annotation/json_annotation.dart';
import 'advice.dart';

part 'single_advice_response.g.dart';

@JsonSerializable()
class SingleAdviceResponse {
  const SingleAdviceResponse({required this.slip});

  factory SingleAdviceResponse.fromJson(Map<String, dynamic> json) {
    return _$SingleAdviceResponseFromJson(json);
  }

  final Advice slip; // {"slip": {...}}

  Advice get advice => slip;

  Map<String, dynamic> toJson() => _$SingleAdviceResponseToJson(this);

  @override
  String toString() {
    return 'SingleAdviceResponse{slip=$slip}';
  }
}
