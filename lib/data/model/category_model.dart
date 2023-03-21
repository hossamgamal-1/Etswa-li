import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.categoryId,
    required super.categoryName,
    required super.categoryImgUrl,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      categoryId: data['id'],
      categoryName: data['name'],
      categoryImgUrl: data['image'],
    );
  }
}
