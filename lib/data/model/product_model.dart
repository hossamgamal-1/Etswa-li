import '../../modules/favourites/business_logic/favourites_controller.dart';
import '../../domain/entities/product.dart';

// ignore: must_be_immutable
class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.price,
    required super.fakePrice,
    required super.title,
    required super.description,
    required super.categoryName,
    required super.imageUrl,
    required super.isFavourite,
    required super.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    num price = data['price'];

    return ProductModel(
      id: data['id'],
      price: price.ceilToDouble() - 0.01,
      fakePrice: price * (price % 5 + 105) / 100,
      title: data['title'],
      description: data['description'],
      categoryName: data['category']['name'],
      imageUrl: data['images'][0].contains('http')
          ? data['images'][0]
          : 'https://api.lorem.space/image/face?w=640&h=480',
      isFavourite: FavouritesController.favouriteItemsIds.contains(data['id']),
      quantity: 1,
    );
  }
}
