import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecom/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D8D7),
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: CustomNavBar(
        screen: routeName,
        product: product,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: MediaQuery.of(context).size.width * 0.005,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [CarouselCard(product: product)],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(
                          50,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.015,
                      ),
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFF73716F),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .headline5!
                            //       .copyWith(
                            //           color:
                            //               Color.fromARGB(255, 255, 255, 255)),
                            // ),
                            Text(
                              '\฿${product.price}',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Product Information",
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        product.description.toString(),
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Delivery Information",
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'ค่าส่ง 20 บาท ตลอด ไม่คิดพิ่มจ้าา',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
