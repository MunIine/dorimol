import 'package:auto_route/auto_route.dart';
import 'package:dorimol/features/cart/bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/theme/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSuccessful extends StatelessWidget {
  const OrderSuccessful({super.key, required this.colorTheme});
  
  final AppColors colorTheme;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 30, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Заказ успешно оформлен", style: AppText.h1.copyWith(color: colorTheme.seedColor)),
            const SizedBox(height: 20),
            const SizedBox(width: 190, child: Image(image: AssetImage("lib/assets/errors/order_successful.png"))),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: TextButton(
                onPressed: () {
                  AutoRouter.of(context).popUntil((route) => route.settings.name == HomeRoute.name);
                  BlocProvider.of<CartBloc>(context).add(ClearCart());
                },
                style: TextButton.styleFrom(backgroundColor: colorTheme.seedColor.withValues(alpha: 0.15)),
                child: Text("Вернуться к покупкам", style: AppText.b4.copyWith(color: colorTheme.seedColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
