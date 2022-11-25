import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/payment/payment_bloc.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/custom_appbar.dart';
import 'package:flutter_ecom/widgets/custom_navbar.dart';
import 'package:pay/pay.dart';

class PaymentSelect extends StatelessWidget {
  static const String routeName = '/payment-selection';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => PaymentSelect(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment select'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PaymentLoaded) {
            return ListView(
              padding: EdgeInsets.all(
                20.0,
              ),
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/payment.jpg',
                  height: 400,
                  width: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<PaymentBloc>().add(
                          SelectPaymentMethod(
                              paymentMethod: PaymentMethod.credit_card),
                        );
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Pay And Confirm',
                  ),
                ),
              ],
            );
          } else {
            return Text('Something wrong');
          }
        },
      ),
    );
  }
}
