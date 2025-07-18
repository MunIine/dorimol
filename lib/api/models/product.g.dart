// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String,
  categoryId: (json['category_id'] as num).toInt(),
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
  price: (json['price'] as num).toDouble(),
  unit: json['unit'] as String,
  stock: (json['stock'] as num).toInt(),
  status: json['status'] as String,
  orderCount: (json['order_count'] as num).toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'unit': instance.unit,
  'stock': instance.stock,
  'status': instance.status,
  'rating': instance.rating,
  'category_id': instance.categoryId,
  'image_url': instance.imageUrl,
  'order_count': instance.orderCount,
};
