import 'package:flutter/material.dart';

class ButtonSquare extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color colors1;
  final Color colors2;

  const ButtonSquare({
    super.key,
    required this.text,
    required this.press,
    required this.colors1,
    required this.colors2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(
          top: 6,
          bottom: 6,
        ),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white60,
                Colors.white60,
              ],
            ),
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
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
