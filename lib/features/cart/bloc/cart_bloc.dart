import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/models/product.dart';
import 'package:dorimol/models/product_in_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.apiClient}) : super(const CartEmpty()) {
    on<UpdateProductInCart>((event, emit) {
      final product = event.product;
      final productsInCart = Map<String, ProductInCart>.from(
        state is CartWithItems ? 
        (state as CartWithItems).productsInCart : 
        {}
      );

      // Change quantity in products in cart
      if (productsInCart.containsKey(product.id)){
        final currentProduct = productsInCart[product.id]!;
        final newQuantity = currentProduct.quantity+event.step;
        
        if (newQuantity <= 0){
          productsInCart.remove(product.id);
        } else{
          productsInCart[product.id] = currentProduct.copyWith(quantity: newQuantity);
        }
      } else{
        productsInCart[product.id] = ProductInCart(product: product, quantity: event.step);
      }

      // Emit state
      if (productsInCart.isNotEmpty) {
        emit(CartWithItems(productsInCart: productsInCart));
      } else {
        emit(const CartEmpty());
      }
    });
    on<ClearCart>((event, emit){
      emit(const CartEmpty());
    });
  }

  final PublicApiClient apiClient;
}
