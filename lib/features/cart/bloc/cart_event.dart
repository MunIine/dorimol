part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class UpdateCartItems extends CartEvent {
  const UpdateCartItems({required this.product, required this.step});
  final Product product;
  final double step;

  @override
  List<Object> get props => [product, step];
}

class ClearCart extends CartEvent {}

class AddOrder extends CartEvent {
  const AddOrder({
    required this.deliveryType, 
    required this.discount,
    required this.city, 
    required this.address, 
    required this.comment
  });


  final DeliveryType deliveryType;
  final int discount;
  final String? city;
  final String? address;
  final String? comment;

  @override
  List<Object> get props => [deliveryType, city ?? '', address ?? '', comment ?? ''];
}