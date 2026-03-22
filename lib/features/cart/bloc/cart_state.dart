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
  const CartWithItems({required this.productsInCart});

  final Map<String, ProductInCart> productsInCart;
  
  double get totalPrice => productsInCart.values.fold(0, (sum, item) => sum + item.product.currentPrice(item.quantity) * item.quantity);

  @override
  List<Object> get props => [productsInCart];
}

extension CartStateX on CartState {
  double quantityOf(String productId) {
    if (this is CartWithItems) {
      return (this as CartWithItems).productsInCart[productId]?.quantity ?? 0.0;
    }
    return 0.0;
  }
}