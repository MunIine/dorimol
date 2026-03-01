import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/models/order.dart';
import 'package:dorimol/models/product.dart';
import 'package:dorimol/models/product_in_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.apiClient}) : super(const CartInitial(delivery: false)) {
    on<UpdateProductInCart>((event, emit) {
      updateProducts(event, emit);
    });
    on<ChangeDelivery>((event, emit){
      delivery = !delivery;
      emit(CartUpdated(
        productsInCart: Map.unmodifiable(productsInCart), 
        products: Map.unmodifiable(products), 
        totalPrice: totalPrice, 
        delivery: delivery
      ));
    });
    on<ClearCart>((event, emit){
      clearCart();
      emit(CartInitial(delivery: delivery));
    });
    on<PlaceOrder>((event, emit) async {
      try {
        emit(OrderLoading());
        await apiClient.placeOrder(Order(
          fullName: event.fullName, 
          phoneNumber: event.phoneNumber, 
          deliveryAddress: delivery ? event.deliveryAddress : null, 
          comment: event.comment!.isNotEmpty ? event.comment : null, 
          items: productsInCart.values.toList()
        ));
        emit(OrderPlaced());
      } on Exception catch (e) {
        emit(OrderFailure(error: e));
      }
    });
  }

  void clearCart() {
    productsInCart.clear();
    products.clear();
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
    emit(CartUpdated(
      productsInCart: Map.unmodifiable(productsInCart), 
      products: Map.unmodifiable(products), 
      totalPrice: totalPrice, 
      delivery: delivery
    ));
  }

  final PublicApiClient apiClient;
  final Map<String, ProductInCart> productsInCart = {};
  final Map<String, Product> products = {};
  double totalPrice = 0;
  bool delivery = false;
}
