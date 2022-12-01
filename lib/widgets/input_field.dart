import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/widget.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextInputType keyboardtType;
  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.textEditingController,
    required this.keyboardtType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        cursorColor: Colors.black,
        obscureText: obscureText,
        controller: textEditingController,
        keyboardType: keyboardtType,
        decoration: InputDecoration(
          hintText: hintText,
          helperStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
