import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/api/models/product_in_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<UpdateProductInCart>((event, emit) {
      updateProducts(event, emit);
    });
    on<ClearCart>((event, emit){
      productsInCart.clear();
      products.clear();
      totalPrice = 0;

      emit(CartInitial());
    });
  }

  void updateProducts(UpdateProductInCart event, Emitter<CartState> emit) {
    if (productsInCart.containsKey(event.product.id) && event.quantity == 0){
      totalPrice -= productsInCart[event.product.id]!.itemPrice * productsInCart[event.product.id]!.quantity;
      products.remove(event.product.id);
      productsInCart.remove(event.product.id);
    }
    else{
      if(productsInCart.containsKey(event.product.id)) totalPrice -= productsInCart[event.product.id]!.itemPrice * productsInCart[event.product.id]!.quantity;
      totalPrice += event.price * event.quantity;
      products[event.product.id] = event.product;
      productsInCart[event.product.id] = ProductInCart(
        productId: event.product.id,
        itemPrice: event.price,
        quantity: event.quantity,
      );
    }
    emit(CartUpdated(productsInCart: Map.unmodifiable(productsInCart), products: Map.unmodifiable(products), totalPrice: totalPrice));
  }

  final Map<String, ProductInCart> productsInCart = {};
  final Map<String, Product> products = {};
  double totalPrice = 0;
}
