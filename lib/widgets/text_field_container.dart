import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white60,
            Colors.white60,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(-2, -2),
            spreadRadius: 1,
            blurRadius: 4,
            color: Colors.black,
          ),
          BoxShadow(
            offset: Offset(2, 2),
            spreadRadius: 1,
            blurRadius: 4,
            color: Colors.black,
          ),
        ],
      ),
      child: child,
    );
  }
}
