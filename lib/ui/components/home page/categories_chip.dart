import 'package:e_commerce/core/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/themes/app_text_styles.dart';
import '../../../data/database/category_data_services.dart';
import '../../../data/database/remote_database.dart';
import '../../../core/injection.dart';
import '../core/list_staggered_animation.dart';
import '../core/snapshot_error_waiting.dart';

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
            child: ListView.builder(
                itemCount: CategoryDataGetter.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                    height: 8.h,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppLightTheme.unSelectedIconColor,
                        width: 0.35.w,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        CategoryDataGetter.categories[index].categoryName,
                        style: AppTextStyles.categoryChipTextStyle,
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
