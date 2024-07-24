import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_model/events_api_connecting/events_api.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatelessWidget {
  final double height;
  final double width;
  const EventsPage({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<EventbriteApi>(context);
    TextEditingController Searchcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SliverAppBar(
            floating: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: Text("Events", style: mediumTextStyle),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    //=============================================================== Event Box
                    EventsList(
                      height: height,
                      width: width,
                      searchController: Searchcontroller,
                    ),
                    Container(
                      height: height * 0.1,
                      width: width,
                      padding: EdgeInsets.only(
                        bottom: height * 0.02,
                      ),
                      //=============================================================== Search Bar
                      child: AppSearchBar(
                        controller: Searchcontroller,
                        hintText: 'Search By City or Events',
                        prefixIcon: AppIcon(
                          iconData: Icons.search,
                          color: Colors.blue,
                          height: height * 0.03,
                        ),
                        width: width,
                        height: height,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
class EventsList extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController searchController;
  const EventsList({
    super.key,
    required this.height,
    required this.width,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EventbriteApi>(
      builder: (context, value, child) => SizedBox(
        height: height * 1,
        child: FutureBuilder(
            future: value.fetchEvents(searchController.text),
            builder: (context, snapshot) {
              if (value.event_List.isNotEmpty) {
                List<dynamic> datassss = value.event_List['events'];

                return ListView.builder(
                  itemCount: datassss.length,
                  padding: EdgeInsets.only(
                    top: height * 0.15,
                    bottom: height * 0.12,
                    left: width * 0.04,
                    right: width * 0.04,
                  ),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> datas = value.event_List;
                    print(datas);
                    List images = [
                      'assets/images/Events_!.png',
                      'assets/images/Events_2.png',
                      'assets/images/Events_3.png',
                      'assets/images/Events_4.png',
                    ];
                    return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          // ========================================================== Function Implement
                        },
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.878,
                          padding: EdgeInsets.only(
                            bottom: height * 0.01,
                            right: width * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(4, 10),
                                blurRadius: 8,
                                color: Color.fromARGB(47, 80, 79, 79),
                              ),
                              BoxShadow(
                                offset: Offset(-4, -1),
                                blurRadius: 8,
                                color: Color.fromARGB(255, 216, 216, 216),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: height,
                                width: width * 0.28,
                                margin: EdgeInsets.all(height * 0.018),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        datassss[index]['images'][0]['url']),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.017),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.5,
                                      //=============================================================== Events Name
                                      child: Text(
                                        datassss[index]['name'],
                                        style: smallTextStyleSemiBold,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    sizedBox(height * 0.01, 0.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.deepOrange),
                                        sizedBox(0.0, width * 0.01),
                                        //=============================================================== Rating
                                        Text('4.8',
                                            style: smallTextStyleSemiBold),
                                        sizedBox(0.0, width * 0.025),
                                        // =============================================================== Reviews
                                        Text('${327} reviews'),
                                      ],
                                    ),
                                    sizedBox(height * 0.01, 0.0),
                                    Row(
                                      children: [
                                        sizedBox(0.0, width * 0.4),
                                        //=============================================================== Price
                                        Text('\$${1879}',
                                            style: smallTextStyleSemiBold),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
