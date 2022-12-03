import 'package:e_commerce/core/injection.dart';
import 'package:e_commerce/ui/widgets/core/list_staggered_animation.dart';
import 'package:e_commerce/ui/widgets/core/snapshot_error_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../data/database/category_data_services.dart';
import '../../../data/database/remote_database.dart';

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
                itemBuilder: (context, index) {
                  return Container(
                      height: 8.h,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 0.35.w),
                      ),
                      child: Center(
                        child: Text(
                          CategoryDataGetter.categories[index].categoryName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ));
                }),
          ),
        ),
      ),
    );
  }
}
