// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      id: json['id'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toDouble(),
      wholesalePrice: (json['wholesale_price'] as num).toDouble(),
      unit: json['unit'] as String,
      stock: (json['stock'] as num).toInt(),
      status: json['status'] as String,
      orderCount: (json['order_count'] as num).toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      vendors: (json['vendors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      feedbacks: (json['feedbacks'] as List<dynamic>)
          .map((e) => ProductFeedback.fromJson(e as Map<String, dynamic>))
          .toList(),
      similars: (json['similars'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'unit': instance.unit,
      'stock': instance.stock,
      'status': instance.status,
      'rating': instance.rating,
      'vendors': instance.vendors,
      'feedbacks': instance.feedbacks.map((e) => e.toJson()).toList(),
      'similars': instance.similars.map((e) => e.toJson()).toList(),
      'category_id': instance.categoryId,
      'wholesale_price': instance.wholesalePrice,
      'image_url': instance.imageUrl,
      'order_count': instance.orderCount,
    };
