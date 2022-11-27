import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/app_text_styles.dart';
import 'package:e_commerce/data/entities/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({required this.title, required this.data, super.key});
  final String title;
  final List<Product> data;
  @override
  Widget build(BuildContext context) {
    double deviceRatio = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / deviceRatio,
          crossAxisCount: 2 * (MediaQuery.of(context).size.width ~/ 480),
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 30.h,
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: CachedNetworkImage(
                imageUrl: data[index].imageUrl,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              /* constraints: BoxConstraints(
                minHeight: 5.h,
                maxHeight: 8.h,
              ), */
              height: 5.h,
              width: 25.w,
              child: Center(
                child: Text(
                  data[index].title,
                  style: AppTextStyles().productTitle.copyWith(
                        fontSize: 3.5.sp,
                      ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${data[index].price}\$',
                  style: AppTextStyles().productTitle.copyWith(
                        fontSize: 4.sp,
                        color: Colors.red,
                      ),
                ),
                Text(
                  '${(data[index].price * 1.2).ceilToDouble() - 0.01}\$',
                  style: AppTextStyles().productTitle.copyWith(
                        fontSize: 2.5.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
