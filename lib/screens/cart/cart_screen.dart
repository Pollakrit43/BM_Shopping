import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecom/models/cart_model.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D8D7),
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is CartLoaded) {
            Map cart = state.cart.productQuantity(state.cart.products);
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.cart.freeDeliveryString,
                         style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                color: Colors.black,
                              ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF403E3D),
                          shape: RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add More Items',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.90,
                    child: ListView.builder(
                      itemCount: cart.keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard.cart(
                          product: cart.keys.elementAt(index),
                          quantity: cart.values.elementAt(index),
                        );
                      },
                    ),
                  ),
                  OrderSummary(),
                ],
              ),
            );
          }
          return Text('Something went wrong');
        },
      ),
    );
  }
}
