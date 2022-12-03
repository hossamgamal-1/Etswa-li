import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/core/product_card.dart';
import '../../data/entities/products.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({required this.title, required this.data, super.key});
  final String title;
  final List<Product> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: ProductCard(index: index, products: data),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 50.w / 40.h,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
