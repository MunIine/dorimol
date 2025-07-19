import 'package:auto_route/annotations.dart';
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
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductDetailsBloc>(context).add(FetchProductDetails(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<AppColors>()!;
    final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16);

    return Scaffold(
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        bloc: BlocProvider.of<ProductDetailsBloc>(context),
        builder: (context, state) {
          if (state is ProductDetailsLoaded){
            final product = state.productDetails;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                ProductImage(
                  imageUrl: product.imageUrl,
                  rating: product.rating,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: padding.copyWith(top: 10, bottom: 18),
                      child: ProductNamePrice(colorTheme: colorTheme, product: product),
                    ),
                    Padding(
                      padding: padding,
                      child: ChangeProductInCart(
                        cartHeight: 50,
                        iconSize: 24,
                        equalWidth: true,
                        weightTextStyle: AppText.h2,
                        priceTextStyle: AppText.t3,
                      ),
                    ),
                    if (product.description != null && product.description!.trim().isNotEmpty) ... [
                      Divider(height: 30),
                      Padding(
                        padding: padding,
                        child: ProductDescription(
                          colorTheme: colorTheme,
                          description: product.description!,
                        ),
                      )
                    ],
                    Divider(height: 30),
                    ProductVendors(colorTheme: colorTheme, padding: padding, vendors: product.vendors),
                    if (product.feedbacks.isNotEmpty) ... [
                      Divider(height: 30),
                      ProductFeedbackWidget(colorTheme: colorTheme, padding: padding, feedbacks: product.feedbacks),
                    ],
                    if (product.similars.isNotEmpty) ... [
                      Divider(height: 30),
                      ProductSimilar(colorTheme: colorTheme, padding: padding, similars: product.similars),
                    ] else SizedBox(height: 8)
                  ],
                ),
              ],
            );
          }
          if (state is ProductDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(child: Text("Ошибка загрузки информации о товаре"));
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
