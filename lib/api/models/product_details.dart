import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/api/models/product_feedback.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetails {
  const ProductDetails({
    required this.id,
    required this.categoryId,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.price,
    required this.wholesalePrice,
    required this.unit,
    required this.stock,
    required this.status,
    required this.orderCount,
    this.rating,
    required this.vendors,
    required this.feedbacks,
    required this.similars
    });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => _$ProductDetailsFromJson(json);

  final String id;
  final String name;
  final String? description;
  final double price;
  final String unit;
  final int stock;
  final String status;
  final double? rating;
  final List<String> vendors;
  final List<ProductFeedback> feedbacks;
  final List<Product> similars;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'wholesale_price')
  final double wholesalePrice;

  @JsonKey(name: 'image_url')
  final String imageUrl;
  
  @JsonKey(name: 'order_count')
  final int orderCount;

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}