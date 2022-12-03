import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/blocs/payment/payment_bloc.dart';
import 'package:flutter_ecom/models/models.dart';
import 'package:flutter_ecom/widgets/custom_appbar.dart';
import 'package:flutter_ecom/widgets/custom_navbar.dart';

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
      backgroundColor: Color(0xFFD9D8D7),
      appBar: CustomAppBar(title: 'Payment'),
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
                MediaQuery.of(context).size.width * 0.05,
              ),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Image.asset(
                  'assets/images/payment.jpg',
                  height: MediaQuery.of(context).size.width * 1,
                  width: MediaQuery.of(context).size.width * 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
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
