import 'package:flutter/material.dart';


Widget reusableButton({
  required String text,
  required VoidCallback function,
}) {
  return Container(
    width: double.infinity,
    color: Colors.deepOrange,
    child: MaterialButton(
      onPressed: function,
      child:  Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
