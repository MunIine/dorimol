import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  const Category({required this.id, required this.name, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  final int id;
  final String name;
  
  @JsonKey(name: 'image_url')
  final String imageUrl;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}