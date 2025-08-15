part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class UpdateProductInCart extends CartEvent {

  const UpdateProductInCart({required this.product, required this.price, required this.quantity});
  final Product product;
  final double price;
  final double quantity;

  @override
  List<Object> get props => [product, price, quantity];
}

class ClearCart extends CartEvent {}

class ChangeDelivery extends CartEvent {}

class PlaceOrder extends CartEvent {
  const PlaceOrder({required this.fullName, required this.phoneNumber, required this.deliveryAddress, required this.comment});

  final String fullName;
  final String phoneNumber;
  final String? deliveryAddress;
  final String? comment;
}
