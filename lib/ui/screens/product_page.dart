import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/entities/products.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 3,
              child: CachedNetworkImage(imageUrl: product.imageUrl),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 30,
                  bottom: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //TODO: rating package implementation
                              const Text(
                                'RAAAAAAAAATE',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${product.count} Reviews',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            '${product.price}\$',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Quantity',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                          Row(
                            children: const [
                              //TODO: add remove quantity logic
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: 2),
                              Text('0',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white)),
                              SizedBox(width: 2),
                              Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                      //const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.star_border,
                              color: Colors.white, size: 24),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blueAccent),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
