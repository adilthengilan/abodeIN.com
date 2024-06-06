import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

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
                    EventsList(height: height, width: width),
                    Container(
                      height: height * 0.1,
                      width: width,
                      padding: EdgeInsets.only(
                        bottom: height * 0.015,
                        top: height * 0.01,
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
  const EventsList({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 1,
      child: ListView.builder(
        itemCount: 4,
        padding: EdgeInsets.only(
          top: height * 0.12,
          bottom: height * 0.12,
          left: width * 0.04,
          right: width * 0.04,
        ),
        itemBuilder: (context, index) {
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
                          image: AssetImage(images[index]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.017),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.5,
                            //=============================================================== Events Name
                            child: Text(
                              'Dubai Evening Dessrt Safari Tour with Hotel Transfer, Camel Ride and BBQ Dinner',
                              style: smallTextStyleSemiBold,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          sizedBox(height * 0.01, 0.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Colors.deepOrange),
                              sizedBox(0.0, width * 0.01),
                              //=============================================================== Rating
                              Text('4.8', style: smallTextStyleSemiBold),
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
                              Text('\$${1879}', style: smallTextStyleSemiBold),
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
      ),
    );
  }
}
