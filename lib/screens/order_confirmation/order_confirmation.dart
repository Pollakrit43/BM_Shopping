import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/cart/cart_bloc.dart';
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
      // extendBodyBehindAppBar: true,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (state is CartLoaded) {
            Map cart = state.cart.productQuantity(state.cart.products);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Color(0xFF73716F),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/pencil.svg',
                            height: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: Center(
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
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: MediaQuery.of(context).size.width * 0.15,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //         primary: Color.fromARGB(255, 0, 174, 255)),
                        //     child: Text(
                        //       'Go Home Page',
                        //       style: TextStyle(
                        //         fontFamily: 'Avenir',
                        //         fontSize:
                        //             MediaQuery.of(context).size.width * 0.045,
                        //         color: Color.fromARGB(255, 0, 0, 0),
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     onPressed: () {
                        //       Navigator.pushNamed(context, '/');
                        //     },
                        //   ),
                        // ),
                        Text(
                          'Order Details',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.90,
                          child: ListView.builder(
                            itemCount: cart.keys.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard.summary(
                                product: cart.keys.elementAt(index),
                                quantity: cart.values.elementAt(index),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
