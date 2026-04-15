import 'package:dorimol/api/private_api_client.dart';
import 'package:dorimol/data/constants.dart';
import 'package:dorimol/models/order_add.dart';
import 'package:dorimol/models/product.dart';
import 'package:dorimol/models/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartEmpty()) {
    on<UpdateCartItems>((event, emit) {
      final product = event.product;
      final cartItems = Map<String, CartItem>.from(
        state is CartWithItems ? 
        (state as CartWithItems).cartItems : 
        {}
      );

      // Change quantity in products in cart
      if (cartItems.containsKey(product.id)){
        final currentProduct = cartItems[product.id]!;
        final newQuantity = currentProduct.quantity+event.step;
        
        if (newQuantity <= 0){
          cartItems.remove(product.id);
        } else{
          cartItems[product.id] = currentProduct.copyWith(quantity: newQuantity);
        }
      } else{
        cartItems[product.id] = CartItem(product: product, quantity: event.step);
      }

      // Emit state
      if (cartItems.isNotEmpty) {
        emit(CartWithItems(cartItems: cartItems));
      } else {
        emit(const CartEmpty());
      }
    });
    on<ClearCart>((event, emit){
      emit(const CartEmpty());
    });

    on<AddOrder>((event, emit) async{
      if (state is! CartWithItems) return;
      final cartItems = (state as CartWithItems).cartItems;
      try {
        await apiClient.addOrder(OrderAdd(
          deliveryType: event.deliveryType,
          city: event.city,
          address: event.address,
          comment: event.comment,
          expectedTotalPrice: (state as CartWithItems).totalPrice, 
          items: (state as CartWithItems).cartItems.values.map((item) => item.toOrderItemAdd()).toList()
        ));
        emit(OrderPlaced());
        emit(const CartEmpty());
      } on Exception catch (e) {
        emit(OrderFailure(error: e));
        emit(CartWithItems(cartItems: cartItems));
      }
    });
  }

  final PrivateApiClient apiClient = GetIt.I<PrivateApiClient>();
}
