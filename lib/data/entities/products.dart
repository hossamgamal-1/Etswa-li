import 'package:e_commerce/modules/favourites/controllers/favourites_controller.dart';

class Product {
  final int id;
  final double price;
  final double fakePrice;
  final String title;
  final String description;
  final String categoryName;
  final String categoryImg;
  final List<String> imageUrls;
  bool isFavourite;

  Product({
    required this.id,
    required this.price,
    required this.fakePrice,
    required this.title,
    required this.description,
    required this.categoryName,
    required this.categoryImg,
    required this.imageUrls,
    required this.isFavourite,
  });
  factory Product.fromJson(Map<String, dynamic> fetchedData) {
    num price = fetchedData['price'];
    List images = fetchedData['images'];

    return Product(
      id: fetchedData['id'],
      price: price.ceilToDouble() - 0.01,
      fakePrice: price * (price % 5 + 105) / 100,
      title: fetchedData['title'],
      description: fetchedData['description'],
      categoryName: fetchedData['category']['name'],
      imageUrls: images.map((e) => e.toString()).toList(),
      categoryImg: fetchedData['category']['image'],
      isFavourite:
          FavouritesController.favouriteItemsIds.contains(fetchedData['id']),
    );
  }
}
