// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFeedback _$ProductFeedbackFromJson(Map<String, dynamic> json) =>
    ProductFeedback(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProductFeedbackToJson(ProductFeedback instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
