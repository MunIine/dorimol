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