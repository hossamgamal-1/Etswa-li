import '../../modules/favourites/controllers/favourites_controller.dart';

class Product {
  final int id;
  final double price;
  final double fakePrice;
  final String title;
  // final String description;
  final String categoryName;
  final String categoryImg;
  final String imageUrl;
  bool isFavourite;
  int quantity;

  Product({
    required this.id,
    required this.price,
    required this.fakePrice,
    required this.title,
    // required this.description,
    required this.categoryName,
    required this.categoryImg,
    required this.imageUrl,
    required this.isFavourite,
    required this.quantity,
  });
  factory Product.fromJson(Map fetchedData) {
    num price = fetchedData['price'];

    return Product(
      id: fetchedData['id'],
      price: price.ceilToDouble() - 0.01,
      fakePrice: price * (price % 5 + 105) / 100,
      title: fetchedData['title'],
      // description: fetchedData['description'],
      categoryName: fetchedData['category']['name'],
      imageUrl: fetchedData['images'][0].contains('http')
          ? fetchedData['images'][0]
          : ['https://api.lorem.space/image/face?w=640&h=480'],
      categoryImg: fetchedData['category']['image'],
      isFavourite:
          FavouritesController.favouriteItemsIds.contains(fetchedData['id']),
      quantity: 1,
    );
  }
}
