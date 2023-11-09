import 'package:flutter/material.dart';

//create a customized button
class MyButton extends StatelessWidget {
  //define the text on the button
  final String text;
  //define the callback function
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      //get the theme color
      color: Theme.of(context).primaryColor,
      child: Text(text),
      );
  }
}
