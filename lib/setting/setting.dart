import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Setting Screen",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}