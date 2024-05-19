import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(30)),
              height: 50,
              width: 320,
              margin: EdgeInsets.only(right: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.only(left: 20, top: 5)),
              ))
        ],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
