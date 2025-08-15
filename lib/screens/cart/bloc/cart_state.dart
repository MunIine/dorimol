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

  const CartUpdated({required this.productsInCart, required this.products, required this.totalPrice, required this.delivery});
  final Map<String, ProductInCart> productsInCart;
  final Map<String, Product> products;
  final double totalPrice;
  final bool delivery;

  @override
  List<Object> get props => [productsInCart, products, totalPrice, delivery];
}

final class OrderLoading extends CartState {}

final class OrderPlaced extends CartState {}

final class OrderFailure extends CartState {

  const OrderFailure({required this.error});
  final Exception error;

  @override
  List<Object> get props => [error];
}