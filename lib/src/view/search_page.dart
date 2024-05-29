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
        "title": "RR International",
        "rooms": 4,
        "Location": "kerala",
      },
      {
        "id": 2,
        "title": "Baithans",
        "rooms": 4,
        "Location": "Bangloor",
      },
      {
        "id": 3,
        "title": "Shoba",
        "rooms": 4,
        "Location": "Hydrabad",
      },
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(30)),
                height: 50,
                width: 320,
                margin: EdgeInsets.only(right: 20),
                child: Consumer<SearchProvider>(
                  builder: (context, search, child) => TextField(
                    onChanged: (enteringKey) =>
                        search.runSearching(enteringKey, hotelList),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here',
                      contentPadding: EdgeInsets.only(left: 20, top: 5),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
          ),
        ],
      ),
    );
  }
}
