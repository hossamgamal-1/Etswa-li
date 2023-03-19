import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/core/product_card.dart';
import '../../data/model/product.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage(
      {required this.title, required this.productsData, super.key});
  final String title;
  final List<Product> productsData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        itemCount: productsData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 50.w / 40.h,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: ProductCard(index: index, products: productsData),
        ),
      ),
    );
  }
}
