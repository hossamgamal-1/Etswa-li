import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../../modules/search/controllers/search_controller.dart';
import '../../../modules/search/ui/search.dart';
import 'home_page_strings.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: kToolbarHeight - 10,
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: ColorManager.primaryColor,
          decoration: InputDecoration(
            hintText: HomePageStrings.appBarSearchHintText,
            border: outLinedBorder(),
            focusedBorder: outLinedBorder(),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: ColorManager.unSelectedIconColor,
          ),
          readOnly: true,
          focusNode: FocusNode(canRequestFocus: false),
          onTap: () {
            context.read<SearchController>().searchedProductsReset();
            FocusScope.of(context).unfocus();
            Navigator.push(
              context,
              PageTransition(
                child: const Search(),
                duration: const Duration(milliseconds: 50),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
        ),
      ),
    );
  }

  OutlineInputBorder outLinedBorder() => OutlineInputBorder(
        borderSide:
            const BorderSide(color: ColorManager.unSelectedIconColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      );
}
