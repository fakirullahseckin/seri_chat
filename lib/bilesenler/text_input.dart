import 'package:flutter/material.dart';
import 'package:flashseri_chat_chat/constants.dart';

class MyTextField extends StatelessWidget {
  MyTextField({this.function, this.text, this.inputType, this.keyboardType});
  final String text;
  final Function function;
  final bool inputType;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: inputType,
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
      ),
      onChanged: (value) {
        //Do something with the user input.
        function(value);
      },
      decoration: kTextFieldDecoration.copyWith(hintText: text),
    );
  }
}
