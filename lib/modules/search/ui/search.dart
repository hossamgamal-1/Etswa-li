import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../ui/widgets/core/grid_staggerd_animation.dart';
import '../../../ui/widgets/core/product_card.dart';
import '../controllers/search_controller.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight - 10,
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            cursorColor: Colors.blueAccent,
            decoration: InputDecoration(
              hintText: 'What are you looking for?',
              border: outLinedBorder(),
              focusedBorder: outLinedBorder(),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.grey,
            ),
            onChanged: context.watch<SearchController>().search,
            autofocus: true,
          ),
        ),
      ),
      body: Consumer<SearchController>(
        builder: (context, value, _) => value.searchValue.isEmpty
            ? const Center(child: Text('Let us know what you\'re looking for'))
            : value.searchValue.length < 3
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.grey))
                : value.searchValue.length > 2 && value.searchedProducts.isEmpty
                    ? const Center(
                        child: Text('Couldn\'t find what you\'re looking for.'))
                    : AnimationLimiter(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 50.w / 40.h,
                          ),
                          itemCount: value.searchedProducts.length,
                          itemBuilder: (context, index) =>
                              GridStaggeredAnimation(
                            listLength: value.searchedProducts.length,
                            child: ProductCard(
                              products: value.searchedProducts,
                              index: index,
                            ),
                          ),
                        ),
                      ),
      ),
    );
  }

  OutlineInputBorder outLinedBorder() => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      );
}
