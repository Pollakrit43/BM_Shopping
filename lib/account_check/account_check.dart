import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AccountCheck({
    super.key,
    required this.login,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account!" : "Already have an Account?",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Create Account" : "Log in",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.width * 0.05,
        // ),
      ],
    );
  }
}
