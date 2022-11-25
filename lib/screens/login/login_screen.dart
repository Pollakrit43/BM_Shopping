import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LoginScreen(),
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
                HeadTextLogin(),
                InfoLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
