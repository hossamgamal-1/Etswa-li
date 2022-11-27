import 'dart:math';

class Product {
  final int id;
  final double price;
  final double fakePrice;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final num rate;
  final int count;

  Product({
    required this.id,
    required this.price,
    required this.fakePrice,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rate,
    required this.count,
  });
  factory Product.fromJson(Map<String, dynamic> fetchedData) {
    num price = fetchedData['price'];
    return Product(
      id: fetchedData['id'],
      price: price.ceilToDouble() - 0.01,
      fakePrice: fetchedData['price'] * (Random().nextDouble() + 1),
      title: fetchedData['title'],
      description: fetchedData['description'],
      category: fetchedData['category'],
      imageUrl: fetchedData['image'],
      rate: fetchedData['rating']['rate'],
      count: fetchedData['rating']['count'],
    );
  }
}
