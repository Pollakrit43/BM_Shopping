import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/models.dart';

import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final bool? isRecommendedCarousel;
  final bool? isMostPopularCarousel;

  const ProductCarousel({
    Key? key,
    required this.products,
    this.isRecommendedCarousel,
    this.isMostPopularCarousel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.005,
            vertical: MediaQuery.of(context).size.height * 0.005,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.height * 0.005,
              ),
              child: ProductCard.catalog(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}
