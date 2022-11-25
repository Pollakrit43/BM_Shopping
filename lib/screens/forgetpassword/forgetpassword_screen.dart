import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/heading_text_forgetpassword.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetpassword';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ForgetPasswordScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeadTextForgetPassword(),
                InfoForgetPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}