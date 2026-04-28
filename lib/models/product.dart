import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  const Product({
    required this.id, 
    required this.categoryId, 
    required this.name, 
    required this.imageUrl, 
    required this.price,
    required this.wholesalePrice,
    required this.wholesaleStartQuantity,
    required this.unit, 
    required this.stock, 
    required this.status, 
    required this.orderCount, 
    this.rating
    });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  final String id;
  final String name;
  final double price;
  final String unit;
  final int stock;
  final String status;
  final double? rating;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'wholesale_price')
  final double wholesalePrice;

  @JsonKey(name: 'wholesale_start_quantity')
  final double wholesaleStartQuantity;

  @JsonKey(name: 'image_url')
  final String imageUrl;
  
  @JsonKey(name: 'order_count')
  final int orderCount;

  double currentPrice (double quantity) => quantity >= wholesaleStartQuantity ? wholesalePrice : price;

  double get step {
    switch (unit.toLowerCase()) {
      case 'кг':
        return 0.5;
      default:
        return 1;
    }
  }

  @override
  String toString() => 'Product($name)';
}