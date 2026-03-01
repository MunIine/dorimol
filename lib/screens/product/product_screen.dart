import 'package:auto_route/auto_route.dart';
import 'package:dorimol/screens/cart/bloc/cart_bloc.dart';
import 'package:dorimol/router/router.dart';
import 'package:dorimol/screens/product/bloc/product_details_bloc.dart';
import 'package:dorimol/screens/product/widgets/export.dart';
import 'package:dorimol/theme/export.dart';
import 'package:dorimol/widgets/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.id});

  final String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductDetailsBloc _productDetailsBloc;

  @override
  void initState() {
    super.initState();
    _productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);
    _productDetailsBloc.add(FetchProductDetails(productId: widget.id));
  }

  @override
  void dispose() {
    if (!_productDetailsBloc.isClosed){
      _productDetailsBloc.add(const ResetProductDetails());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16);

    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsBloc>(context),
      builder: (context, state) {
        if (state is ProductDetailsLoaded) {
          final product = state.productDetails;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              ProductImage(
                colorTheme: colorTheme,
                imageUrl: product.imageUrl,
                rating: product.rating,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: padding.copyWith(top: 10, bottom: 18),
                    child: ProductNamePrice(
                      colorTheme: colorTheme,
                      product: product,
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: BlocSelector<CartBloc, CartState, double>(
                      selector: (state) {
                        if (state is CartUpdated &&
                            state.productsInCart.containsKey(product.id)) {
                          return state.productsInCart[product.id]!.quantity;
                        }
                        return 0.0;
                      },
                      builder: (context, quantity) {
                        return ChangeProductInCart(
                          cartHeight: 50,
                          iconSize: 24,
                          equalWidth: true,
                          weightTextStyle: AppText.h2,
                          priceTextStyle: AppText.t3,
                          product: product.getProduct,
                          quantity: quantity,
                        );
                      },
                    ),
                  ),
                  if (product.description != null &&
                      product.description!.trim().isNotEmpty) ...[
                    const Divider(height: 30),
                    Padding(
                      padding: padding,
                      child: ProductDescription(
                        colorTheme: colorTheme,
                        description: product.description!,
                      ),
                    ),
                  ],
                  const Divider(height: 30),
                  ProductVendors(
                    colorTheme: colorTheme,
                    padding: padding,
                    vendors: product.vendors,
                  ),
                  if (product.feedbacks.isNotEmpty) ...[
                    const Divider(height: 30),
                    ProductFeedbackWidget(
                      colorTheme: colorTheme,
                      padding: padding,
                      feedbacks: product.feedbacks,
                    ),
                  ],
                  if (product.similars.isNotEmpty) ...[
                    const Divider(height: 30),
                    ProductSimilar(
                      colorTheme: colorTheme,
                      padding: padding,
                      similars: product.similars,
                    ),
                  ] else
                    const SizedBox(height: 8),
                ],
              ),
            ],
          );
        }
        if (state is ProductDetailsFailure) {
          AutoRouter.of(context).replace(ErrorRoute(exception: state.error));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
