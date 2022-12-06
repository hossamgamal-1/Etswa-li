import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../core/app_constants.dart';
import '../entities/categories.dart';

abstract class CategoryDataService {
  Future<void> getCategoriesData();
}

class CategoryDataGetter implements CategoryDataService {
  static List<Category> categories = [];

  @override
  Future<void> getCategoriesData() async {
    String categoriesUrl =
        '${AppConstants.baseUrl}${AppConstants.categoriesEndpoint}';
    if (categories.isEmpty) {
      http.Response response = await http.get(Uri.parse(categoriesUrl));
      List dataList = json.decode(response.body);

      try {
        for (var data in dataList) {
          categories.length < dataList.length
              ? categories.add(Category.fromJson(data))
              : null;
        }
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }
}
