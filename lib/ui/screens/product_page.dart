import 'package:e_commerce/core/themes/app_text_styles.dart';
import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/entities/products.dart';
import '../components/product page/cart_quantity.dart';
import '../components/product page/product_page_strings.dart';
import '../components/product page/rating_price_bar.dart';

//TODO: PRoduct Page is mod7eka

class ProductPage extends StatelessWidget {
  const ProductPage(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: appBar(),
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 3,
                child: CachedNetworkImage(imageUrl: product.imageUrls[0])),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppLightTheme.cursorColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 30,
                  bottom: 10,
                ),
                child: ListView(
                  children: [
                    Text(
                      ProductPageStrings.about,
                      style: AppTextStyles.productPageTitleTextStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: AppTextStyles.productPageDiscribtionTextStyle,
                    ),
                    const SizedBox(height: 10),
                    RatingPriceBar(product),
                    const SizedBox(height: 10),
                    const CartQuantity(),
                    addToCartButton()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addToCartButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppLightTheme.canvasColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextButton(
          onPressed: () {},
          child: Text(
            ProductPageStrings.addToCart,
            style: AppTextStyles.productPageButtonTextStyle,
          )),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        product.title,
        style: AppTextStyles.productPageAppBarTextStyle,
      ),
      centerTitle: true,
    );
  }
}
