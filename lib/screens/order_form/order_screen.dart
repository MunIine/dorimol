import 'package:auto_route/auto_route.dart';
import 'package:dorimol/bloc/cart_bloc/cart_bloc.dart';
import 'package:dorimol/screens/order_form/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            SizedBox(height: 16),
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
          if (state is OrderFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Ошибка'),
                  content: Text('Не удалось оформить заказ. Попробуйте еще раз.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        AutoRouter.of(context).pushPath("/");
                        BlocProvider.of<CartBloc>(context).add(ClearCart());
                      },
                      child: Text('ОК'),
                    ),
                  ],
                ),
              );
            });
          }
          if (state is OrderPlaced) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Заказ оформлен'),
                  content: Text('Ваш заказ успешно оформлен!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        AutoRouter.of(context).pushPath("/");
                        BlocProvider.of<CartBloc>(context).add(ClearCart());
                      },
                      child: Text('ОК'),
                    ),
                  ],
                ),
              );
            });
          }
          if (state is CartUpdated) {
            return OrderButton(
              colorTheme: colorTheme, 
              price: state.totalPrice, 
              onTap:() => placeOrder(
                fullNameController,
                phoneNumberController,
                addressController,
                commentController,
                state.productsInCart.isNotEmpty,
                context
            ));
          }
          return OrderButton(colorTheme: colorTheme, price: 0, onTap: (){});
        },
      ),
    );
  }

  void placeOrder(
    TextEditingController fullNameController,
    TextEditingController phoneNumberController,
    TextEditingController addressController,
    TextEditingController commentController,
    bool items,
    BuildContext context
  ){
    if (fullNameController.text.trim().isNotEmpty && phoneNumberController.text.trim().isNotEmpty && items){
      BlocProvider.of<CartBloc>(context).add(PlaceOrder(
        fullName: fullNameController.text.trim(), 
        phoneNumber: phoneNumberController.text.trim(), 
        deliveryAddress: addressController.text.trim(), 
        comment: commentController.text.trim()
      ));
    }
  }
}
