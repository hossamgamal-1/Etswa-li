import 'package:e_commerce/ui/components/home%20page/home_page_strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/app_light_theme.dart';
import '../../../modules/search/controllers/search_controller.dart';
import '../../../modules/search/ui/search.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: kToolbarHeight - 10,
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: AppLightTheme.cursorColor,
          decoration: InputDecoration(
            hintText: HomePageStrings.appBarSearchHintText,
            border: outLinedBorder(),
            focusedBorder: outLinedBorder(),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: AppLightTheme.unSelectedIconColor,
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
        borderSide: const BorderSide(
            color: AppLightTheme.unSelectedIconColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      );
}
