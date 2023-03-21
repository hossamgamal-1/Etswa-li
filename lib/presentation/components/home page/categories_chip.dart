import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../../../data/database/category_data_services.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/model/category_model.dart';
import '../../screens/see_all_page.dart';
import '../core/list_staggered_animation.dart';

class CategoriesChip extends StatelessWidget {
  const CategoriesChip({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListStaggeredAnimation(
        child: ListView.builder(
          itemCount: CategoryDataGetter.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            CategoryModel category = CategoryDataGetter.categories[index];
            return ListStaggeredAnimation(
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    child: SeeAllPage(
                      title: category.categoryName,
                      productsData: ProductsDataGetter.products
                          .where((product) =>
                              product.categoryName == category.categoryName)
                          .toList(),
                    ),
                    type: PageTransitionType.bottomToTop,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20.w,
                      height: 15.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            category.categoryImgUrl,
                          ),
                        ),
                      ),
                    ),
                    Text(category.categoryName)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
