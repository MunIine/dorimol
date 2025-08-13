import 'package:auto_route/auto_route.dart';
import 'package:dorimol/bloc/cart_bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/order_form/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/pop_up/order_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderAppBar(colorTheme: colorTheme),
            Expanded(
              child: ListView(
                children: [
                  OrderNameNumberBlock(colorTheme: colorTheme, fullNameController: fullNameController, phoneNumberController: phoneNumberController),
                  SizedBox(height: 16),
                  OrderDeliveryBlock(colorTheme: colorTheme, controller: addressController),
                  SizedBox(height: 16),
                  OrderProductsCommentBlock(colorTheme: colorTheme, controller: commentController),
                  SizedBox(height: 16),
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
            return OrderButton(
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
          return OrderButton(colorTheme: colorTheme, price: 0, onTap: (){}, enabled: false);
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
