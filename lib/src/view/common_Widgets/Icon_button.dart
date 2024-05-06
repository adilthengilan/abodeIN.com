import 'package:flutter/material.dart';

class AppBackIconButton extends StatelessWidget {
  const AppBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 40, left: 25),
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey),
        child: Center(
            child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
      ),
    );
  }
}
