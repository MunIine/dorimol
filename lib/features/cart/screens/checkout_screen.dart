import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/account/bio/bloc/account_bloc.dart';
import 'package:dorimol/features/cart/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key, 
    required this.colorTheme, 
    required this.cityNotifier, 
    required this.addressController, 
    required this.commentController,
    required this.deliveryNotifier
  });

  final AppColors colorTheme;
  final ValueNotifier<String?> cityNotifier;
  final ValueNotifier<bool> deliveryNotifier;
  final TextEditingController addressController;
  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Оформление заказа", style: AppText.h1.copyWith(color: colorTheme.textBlack, height: 1.3)),
        const SizedBox(height: 16),
        BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoaded){
              final user = state.user;

              if (cityNotifier.value == null) cityNotifier.value = user.city;
              if (addressController.text.isEmpty) addressController.text = user.address ?? "";

              return Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: deliveryNotifier,
                        builder: (_, _, _) {
                          return CartDeliveryBlock(
                            colorTheme: colorTheme, 
                            deliveryNotifier: deliveryNotifier,
                            cityNotifier: cityNotifier,
                            addressController: addressController, 
                          );
                        }
                      ),
                      const SizedBox(height: 16),
                      CartCommentBlock(colorTheme: colorTheme, controller: commentController),
                      const SizedBox(height: 16),
                      CartDiscountBlock(colorTheme: colorTheme, discount: user.currentDiscount),
                      const SizedBox(height: 16),
                      CartResultsBlock(colorTheme: colorTheme, discount: user.currentDiscount),
                    ],
                  ),
                ),
              );
            }
            if (state is AccountFailure){
              return Text("Ошибка загрузки данных аккаунта", style: AppText.b3.copyWith(color: colorTheme.textBlack));
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
