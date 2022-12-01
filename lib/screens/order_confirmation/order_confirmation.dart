import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OrderConfirmation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D8D7),
      appBar: CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Color(0xFF73716F),
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.9,
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.25,
                right: MediaQuery.of(context).size.width * 0.1,
                child: SvgPicture.asset(
                  'assets/svgs/pencil.svg',
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Order is complete!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Thank you for purchasing on BM Shopping',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OrderSummary(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 174, 255)),
                    child: Text(
                      'Go Home Page',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
                // Text(
                //   'Order Details',
                //   style: Theme.of(context).textTheme.headline3,
                // ),
                // Divider(
                //   thickness: 2,
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // ListView(
                //   shrinkWrap: true,
                //   padding: EdgeInsets.zero,
                //   physics: NeverScrollableScrollPhysics(),
                //   children: [
                //     ProductCard.summary(
                //       product: Product.products[0],
                //       quantity: 2,
                //     ),
                //     ProductCard.summary(
                //       product: Product.products[0],
                //       quantity: 2,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
