import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';

import '../../../data/database/category_data_services.dart';
import '../../../data/database/products_data_services.dart';
import '../../../data/database/remote_database.dart';
import '../../../core/injection.dart';
import '../../../data/entities/categories.dart';
import '../core/list_staggered_animation.dart';
import '../core/snapshot_error_waiting.dart';
import '../../../ui/screens/see_all_page.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemoteDatabase remoteDatabase = RemoteDatabase(getIt(), getIt());
    return FutureBuilder<void>(
      future: remoteDatabase.getCategoriesData(),
      builder: (context, snapShots) => SnapShotErrorWaitingHandler(
        snapShots: snapShots,
        child: AnimationLimiter(
          child: ListStaggeredAnimation(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: CategoryDataGetter.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Category category = CategoryDataGetter.categories[index];
                  return ListStaggeredAnimation(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        PageTransition(
                          child: SeeAllPage(
                            title: category.categoryName,
                            productsData: ProductsDataGetter.products
                                .where((product) =>
                                    product.categoryName ==
                                    category.categoryName)
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
          ),
        ),
      ),
    );
  }
}
