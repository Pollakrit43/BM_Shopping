import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => RegisterScreen(),
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
                HeadTextRegister(),
                InfoRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
