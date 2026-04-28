import 'package:json_annotation/json_annotation.dart';

part 'product_feedback.g.dart';

@JsonSerializable()
class ProductFeedback {
  const ProductFeedback({
    required this.id, 
    required this.rating, 
    required this.comment, 
    required this.updatedAt, 
    required this.createdAt
  });

  factory ProductFeedback.fromJson(Map<String, dynamic> json) => _$ProductFeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$ProductFeedbackToJson(this);

  final int id;
  final int rating;
  final String comment;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;
}