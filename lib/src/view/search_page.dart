import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List hotelList = [
      {
        "id": 1,
        "title": "Nihala",
        "rooms": 4,
        "Location": "kerala",
      },
      {
        "id": 2,
        "title": 2222,
        "rooms": 4,
        "Location": "Bangloor",
      },
      {
        "id": 3,
        "title": "Shadhiya",
        "rooms": 4,
        "Location": "Hydrabad",
      },
    ];
    return Scaffold(
      body: Column(
        children: [
          sizedBox(30.0, 0.0),
          Consumer<SearchProvider>(
            builder: (context, Search, child) => SearchBar(
              onChanged: (enteringKey) => Search.runSearching(enteringKey, hotelList),
            ),
          ),
          Consumer<SearchProvider>(
            builder: (context, search, child) => ListView.builder(
              itemCount: search.foundHotels.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Text("${search.foundHotels[index]["title"]}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
