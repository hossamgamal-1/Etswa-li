import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
          cursorColor: Colors.blueAccent,
          decoration: InputDecoration(
            hintText: 'What are you looking for?',
            border: outLinedBorder(),
            focusedBorder: outLinedBorder(),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.grey,
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
        borderSide: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      );
}
