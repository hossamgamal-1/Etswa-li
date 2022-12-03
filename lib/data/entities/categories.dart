class Category {
  final int categoryId;
  final String categoryName;
  final String categoryImgUrl;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImgUrl,
  });
  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(
      categoryId: data['id'],
      categoryName: data['name'],
      categoryImgUrl: data['image'],
    );
  }
}
