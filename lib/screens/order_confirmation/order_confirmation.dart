import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/custom_appbar.dart';
import 'package:flutter_ecom/widgets/custom_navbar.dart';
import 'package:flutter_ecom/widgets/order_summary.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Color(0xFF73716F),
                  width: double.infinity,
                  height: 350,
                ),
                Positioned(
                  left: 130,
                  top: 100,
                  child: SvgPicture.asset(
                    'assets/svgs/pencil.svg',
                    height: 150,
                  ),
                ),
                Positioned(
                  top: 280,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Order is complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thank you for purchasing on BM Shopping',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  OrderSummary(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

