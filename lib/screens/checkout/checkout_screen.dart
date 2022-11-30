import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D8D7),
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.05,
          ),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer information',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextFormField(
                      title: 'Email',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(email: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'Full Name',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(fullName: value));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Text(
                      'Delivery information',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomTextFormField(
                      title: 'Address',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(address: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'City',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(city: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'Country',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(country: value));
                      },
                    ),
                    CustomTextFormField(
                      title: 'ZIP Code',
                      onChanged: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateCheckout(zipCode: value));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.18,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(color: Color(0xFF403E3D)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/payment-selection',
                                );
                              },
                              child: Text(
                                'Select a payment',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/payment-selection',
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Order summary',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    OrderSummary()
                  ],
                );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }
}
