import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecom/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecom/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard.catalog({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isCatalog = true,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.wishlist({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 1.1,
    this.height = 150,
    this.isCatalog = false,
    this.isWishlist = true,
    this.isCart = false,
    this.isSummary = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const ProductCard.cart({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = true,
    this.isSummary = false,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  const ProductCard.summary({
    Key? key,
    required this.product,
    this.quantity,
    this.widthFactor = 2.25,
    this.height = 80,
    this.isCatalog = false,
    this.isWishlist = false,
    this.isCart = false,
    this.isSummary = true,
    this.iconColor = Colors.black,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final Product product;
  final int? quantity;
  final double widthFactor;
  final double height;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final bool isSummary;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        if (isCatalog || isWishlist)
          Navigator.pushNamed(
            context,
            '/product',
            arguments: product,
          );
      },
      child: isCart || isSummary
          ? Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                children: [
                  ProductImage(
                    adjWidth: MediaQuery.of(context).size.width * 0.25,
                    height: height - MediaQuery.of(context).size.width * 0.05,
                    product: product,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Expanded(
                    child: ProductInformation(
                      product: product,
                      fontColor: fontColor,
                      quantity: quantity,
                      isOrderSummary: isSummary ? true : false,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  ProductActions(
                    product: product,
                    isCatalog: isCatalog,
                    isWishlist: isWishlist,
                    isCart: isCart,
                    iconColor: iconColor,
                    quantity: quantity,
                  )
                ],
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ProductImage(
                  adjWidth: adjWidth - MediaQuery.of(context).size.width * 0.05,
                  height: height - MediaQuery.of(context).size.width * 0.05,
                  product: product,
                ),
                ProductBackground(
                  adjWidth: adjWidth - MediaQuery.of(context).size.width * 0.02,
                  widgets: [
                    ProductInformation(
                      product: product,
                      fontColor: fontColor,
                    ),
                    ProductActions(
                      product: product,
                      isCatalog: isCatalog,
                      isWishlist: isWishlist,
                      isCart: isCart,
                      iconColor: iconColor,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.adjWidth,
    required this.height,
    required this.product,
  }) : super(key: key);

  final double adjWidth;
  final double height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - MediaQuery.of(context).size.width * 0.005,
      height: height - MediaQuery.of(context).size.width * 0.005,
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    Key? key,
    required this.product,
    required this.fontColor,
    this.isOrderSummary = false,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final Color fontColor;
  final bool isOrderSummary;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                product.name,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '\฿${product.price} ',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: fontColor,
              ),
            ),
          ],
        ),
        isOrderSummary
            ? Text(
                'Quantity - $quantity',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class ProductActions extends StatelessWidget {
  const ProductActions({
    Key? key,
    required this.product,
    required this.isCatalog,
    required this.isWishlist,
    required this.isCart,
    required this.iconColor,
    this.quantity,
  }) : super(key: key);

  final Product product;
  final bool isCatalog;
  final bool isWishlist;
  final bool isCart;
  final Color iconColor;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (state is CartLoaded) {
          IconButton addProduct = IconButton(
            icon: Icon(
              Icons.add_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to your Cart!'),
                ),
              );
              context.read<CartBloc>().add(AddProduct(product));
            },
          );

          IconButton removeProduct = IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from your Cart!'),
                ),
              );
              context.read<CartBloc>().add(RemoveProduct(product));
            },
          );

          IconButton removeFromWishlist = IconButton(
            icon: Icon(
              Icons.delete,
              color: iconColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from your Wishlist!'),
                ),
              );
              context
                  .read<WishlistBloc>()
                  .add(RemoveProductFromWishlist(product));
            },
          );

          Text productQuantity = Text(
            '$quantity',
            style: Theme.of(context).textTheme.headline4,
          );

          if (isCatalog) {
            return Row(children: [addProduct]);
          } else if (isWishlist) {
            return Row(children: [addProduct, removeFromWishlist]);
          } else if (isCart) {
            return Row(children: [removeProduct, productQuantity, addProduct]);
          } else {
            return SizedBox();
          }
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}

class ProductBackground extends StatelessWidget {
  const ProductBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - MediaQuery.of(context).size.width * 0.05,
      height: MediaQuery.of(context).size.width * 0.2,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(50),
      ),
      child: Container(
        width: adjWidth - MediaQuery.of(context).size.width * 0.05,
        height: MediaQuery.of(context).size.width * 0.2,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width * 0.01,
        ),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
      // width: MediaQuery.of(context).size.width * 0.4,
      // height: MediaQuery.of(context).size.width * 0.2,
      // margin: EdgeInsets.only(
      //   bottom: MediaQuery.of(context).size.width * 0.01,
      // ),
      // alignment: Alignment.bottomCenter,
      // decoration: BoxDecoration(
      //   color: Colors.black.withAlpha(50),
      // ),
      // child: Container(
      //   width: MediaQuery.of(context).size.width * 0.4,
      //   height: MediaQuery.of(context).size.width * 0.2,
      //   margin: EdgeInsets.only(
      //     bottom: MediaQuery.of(context).size.width * 0.01,
      //   ),
      //   alignment: Alignment.bottomCenter,
      //   decoration: BoxDecoration(color: Colors.black),
      //   child: Padding(
      //     padding: EdgeInsets.all(
      //       MediaQuery.of(context).size.width * 0.02,
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [...widgets],
      //     ),
      //   ),
      // ),
    );
  }
}
