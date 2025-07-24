part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {
  const CartInitial({required this.delivery});

  final bool delivery;

  @override
  List<Object> get props => [delivery];
}

class CartUpdated extends CartState {
  final Map<String, ProductInCart> productsInCart;
  final Map<String, Product> products;
  final double totalPrice;
  final bool delivery;

  const CartUpdated({required this.productsInCart, required this.products, required this.totalPrice, required this.delivery});

  @override
  List<Object> get props => [productsInCart, products, totalPrice, delivery];
}

final class OrderLoading extends CartState {}

final class OrderPlaced extends CartState {}

final class OrderFailure extends CartState {
  final Object error;

  const OrderFailure({required this.error});

  @override
  List<Object> get props => [error];
}