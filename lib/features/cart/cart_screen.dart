import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/features/cart/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/pop_up/order_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartAppBar(colorTheme: colorTheme),
            Expanded(
              child: ListView(
                children: [
                  CartNameNumberBlock(colorTheme: colorTheme, fullNameController: fullNameController, phoneNumberController: phoneNumberController),
                  const SizedBox(height: 16),
                  CartDeliveryBlock(colorTheme: colorTheme, controller: addressController),
                  const SizedBox(height: 16),
                  CartProductsCommentBlock(colorTheme: colorTheme, controller: commentController),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is OrderPlaced) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => OrderSuccessful(colorTheme: colorTheme)
              );
            });
          }
          if (state is OrderFailure) {
            AutoRouter.of(context).push(ErrorRoute(exception: state.error));
            BlocProvider.of<CartBloc>(context).add(ClearCart());
          }
          if (state is CartUpdated) {
            return CartButton(
              colorTheme: colorTheme, 
              price: state.totalPrice, 
              onTap:() => placeOrder(
                state.delivery,
                state.productsInCart.isNotEmpty,
                context
              ),
              enabled: checkConditions(state.delivery, state.productsInCart.isNotEmpty),
            );
          }
          return CartButton(colorTheme: colorTheme, price: 0, onTap: (){}, enabled: false);
        },
      ),
    );
  }

  void placeOrder(
    bool delivery,
    bool items,
    BuildContext context
  ){
    if (checkConditions(delivery, items)){
      BlocProvider.of<CartBloc>(context).add(PlaceOrder(
        fullName: fullNameController.text.trim(), 
        phoneNumber: phoneNumberController.text.trim(), 
        deliveryAddress: addressController.text.trim(), 
        comment: commentController.text.trim()
      ));
    }
  }

  bool checkConditions(
    bool delivery,
    bool items,
  ){
    return fullNameController.text.trim().isNotEmpty 
    && phoneNumberController.text.trim().isNotEmpty 
    && items 
    && ((delivery && addressController.text.trim().isNotEmpty) || !delivery);
  }
}
