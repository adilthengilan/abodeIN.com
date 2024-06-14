import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view_Model/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final List hotelList = [
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: height * 0.1,
        leadingWidth: width,
        leading: Container(
          height: height * 0.1, 
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.005),
          child: Consumer<SearchProvider>(
            builder: (context, search, child) => AppSearchBar(
              onChange: (enteringKey) => search.runSearching(enteringKey, hotelList),
              prefixIcon: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_rounded),
              ),
              hintText: "Enter Destination", width: width, height: height,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<SearchProvider>(
              builder: (context, search, child) => SizedBox(
                height: height,
                width: width,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  itemCount: search.foundHotels.length,
                  itemBuilder: (context, index) {
                    print(search.foundHotels);
                    return InkWell(
                      onTap: () {
                        search.getCurrentPosition(context);
                      },
                      child: ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text("${search.foundHotels[index]["title"]}"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
