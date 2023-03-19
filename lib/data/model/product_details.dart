import 'package:e_commerce/data/model/product.dart';

import '../../modules/favourites/controllers/favourites_controller.dart';

class ProductDetails extends Product {
  final String description;

  ProductDetails({
    required id,
    required price,
    required fakePrice,
    required title,
    required this.description,
    required categoryName,
    required categoryImg,
    required imageUrl,
    required isFavourite,
    required quantity,
  }) : super(
            id: id,
            price: price,
            fakePrice: fakePrice,
            title: title,
            categoryName: categoryName,
            categoryImg: categoryImg,
            imageUrl: imageUrl,
            isFavourite: isFavourite,
            quantity: quantity);
  factory ProductDetails.fromJson(Map fetchedData) {
    num price = fetchedData['price'];

    return ProductDetails(
      id: fetchedData['id'],
      price: price.ceilToDouble() - 0.01,
      fakePrice: price * (price % 5 + 105) / 100,
      title: fetchedData['title'],
      description: fetchedData['description'],
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
