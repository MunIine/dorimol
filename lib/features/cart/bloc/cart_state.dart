part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

class CartEmpty extends CartState {
  const CartEmpty();
}

class CartWithItems extends CartState {
  const CartWithItems({required this.cartItems});

  final Map<String, CartItem> cartItems;

  double get totalPrice => cartItems.values.fold(0, (sum, item) => sum + item.product.currentPrice(item.quantity) * item.quantity);

  @override
  List<Object> get props => [cartItems];
}

class OrderFailure extends CartState {
  const OrderFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}

class OrderPlaced extends CartState{}

extension CartStateX on CartState {
  double quantityOf(String productId) {
    if (this is CartWithItems) {
      return (this as CartWithItems).cartItems[productId]?.quantity ?? 0.0;
    }
    return 0.0;
  }
}