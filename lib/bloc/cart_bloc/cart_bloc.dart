import 'package:dorimol/api/api.dart';
import 'package:dorimol/api/models/order.dart';
import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/api/models/product_in_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.apiClient}) : super(CartInitial(delivery: false)) {
    on<UpdateProductInCart>((event, emit) {
      updateProducts(event, emit);
    });
    on<ChangeDelivery>((event, emit){
      totalPrice += delivery ? -30 : 30;
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
    totalPrice = delivery ? 30 : 0;
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

  final DorimolApiClient apiClient;
  final Map<String, ProductInCart> productsInCart = {};
  final Map<String, Product> products = {};
  double totalPrice = 0;
  bool delivery = false;
}
