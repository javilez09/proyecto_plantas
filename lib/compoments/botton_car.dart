// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButtonCar extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButtonCar({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 15),
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
