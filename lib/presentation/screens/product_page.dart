import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_pixels/image_pixels.dart';

import '../../core/injection.dart';
import '../../data/model/product_model.dart';
import '../../domain/use_cases/use_cases.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../components/product page/add_to_cart_button.dart';
import '../components/product page/product_description.dart';
import '../components/product page/product_page_cart_quantity.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(this.productId, {super.key});
  final int productId;
  @override
  Widget build(BuildContext context) {
    UseCases useCases = UseCases(sL(), sL(), sL());

    return FutureBuilder<ProductModel>(
      future: useCases.getProductDetails(productId),
      builder: (context, snapShots) {
        late ProductModel product;
        if (snapShots.hasData) {
          product = snapShots.data!;
        }
        return snapShots.hasError
            ? Scaffold(
                body: Center(
                  child: Text('An error happend/n${snapShots.error}',
                      style: getRegularTextStyle(
                          color: ColorManager.offerPriceColor)),
                ),
              )
            : snapShots.connectionState == ConnectionState.waiting
                ? const Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.primaryColor)),
                  )
                : ImagePixels(
                    imageProvider: CachedNetworkImageProvider(product.imageUrl),
                    builder: (context, img) {
                      Color backgroundColor = img.pixelColorAt!(0, 0);
                      double pageHeight = (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          kToolbarHeight);

                      return SafeArea(
                        child: Scaffold(
                          appBar: PreferredSize(
                            preferredSize:
                                const Size.fromHeight(kToolbarHeight),
                            child: appBar(product.title, backgroundColor),
                          ),
                          backgroundColor: backgroundColor,
                          body: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                height: 0.43 * pageHeight,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        product.imageUrl),
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: ColorManager.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(80),
                                      topRight: Radius.circular(80),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                        offset: Offset(0, -2),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                    top: 30,
                                    bottom: 10,
                                  ),
                                  child: ListView(
                                    children: [
                                      ProductDescription(product: product),
                                      ProductPageCartQuantity(product),
                                      SizedBox(height: 0.01 * pageHeight),
                                      AddToCartButton(
                                        product: product,
                                        backgroundColor: backgroundColor,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }

  Widget appBar(String title, Color backgroundColor) {
    Color fontColor = (backgroundColor.computeLuminance() > 0.5)
        ? ColorManager.white
        : ColorManager.black;
    return AppBar(
      title: Text(title,
          style: getRegularTextStyle(
              color: fontColor, fontSize: FontSize.s5_8.sp)),
      backgroundColor: backgroundColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: fontColor),
    );
  }

/*   Future<void> initFunction(Color backgroundColor) async {
    await FlutterStatusbarcolor.setStatusBarColor(
      backgroundColor,
      animate: true,
    );
    await FlutterStatusbarcolor.setNavigationBarColor(
      backgroundColor,
      animate: true,
    );
  }
 */
}
