import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../core/app_constants.dart';
import '../model/category_model.dart';

abstract class CategoryDataService {
  Future<void> getCategoriesData();
}

class CategoryDataGetter implements CategoryDataService {
  static List<CategoryModel> categories = [];

  @override
  Future<void> getCategoriesData() async {
    String categoriesUrl =
        '${AppConstants.baseUrl}${AppConstants.categoriesEndpoint}';
    if (categories.isEmpty) {
      http.Response response = await http.get(Uri.parse(categoriesUrl));
      List dataList = json.decode(response.body);

      for (var data in dataList) {
        try {
          categories.length < dataList.length
              ? categories.add(CategoryModel.fromJson(data))
              : null;
        } catch (error) {
          debugPrint(error.toString());
        }
      }
    }
  }
}
