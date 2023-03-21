import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final int id;
  final double price;
  final double fakePrice;
  final String title;
  final String description;
  final String categoryName;
  final String imageUrl;
  bool isFavourite;
  int quantity;

  Product(
      {required this.id,
      required this.price,
      required this.fakePrice,
      required this.title,
      required this.description,
      required this.categoryName,
      required this.imageUrl,
      required this.isFavourite,
      required this.quantity});

  @override
  List<Object?> get props => [
        id,
        price,
        fakePrice,
        title,
        description,
        categoryName,
        imageUrl,
        isFavourite,
        quantity
      ];
}
