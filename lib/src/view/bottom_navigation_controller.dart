import 'package:abodein/src/view/Favourites/favourites.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/profile/profile_screen.dart';
import 'package:abodein/src/view/reward/reward_screen.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_model/bools_provider.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

// class Bottom_Navigation_Bar extends StatelessWidget {
//   const Bottom_Navigation_Bar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final BottmBarIndex = Provider.of<DashBoardProvider>(context);
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(bottom: 0),
//         child: CrystalNavigationBar(
//           currentIndex: BottmBarIndex.bottombarindex,
//           // indicatorColor: Colors.white,
//           unselectedItemColor: Colors.white70,
//           backgroundColor: Color.fromARGB(194, 0, 0, 0),
//           // outlineBorderColor: Colors.black.withOpacity(0.1),
//           onTap: (index) {
//             BottmBarIndex.setBottomBarindex(index);
//           },
//           items: [
//             /// Home
//             CrystalNavigationBarItem(
//               icon: IconlyBold.home,
//               unselectedIcon: IconlyLight.home,
//               selectedColor: Colors.white,
//             ),

//             /// Favourite
//             CrystalNavigationBarItem(
//               icon: IconlyBold.heart,
//               unselectedIcon: IconlyLight.heart,
//               selectedColor: Colors.red,
//             ),

//             /// Add

//             /// Search
//             CrystalNavigationBarItem(
//                 icon: IconlyBold.activity,
//                 unselectedIcon: IconlyLight.search,
//                 selectedColor: Colors.white),

//             /// Profile
//             CrystalNavigationBarItem(
//               icon: IconlyBold.user_2,
//               unselectedIcon: IconlyLight.user,
//               selectedColor: Colors.white,
//             ),
//           ],
//         ),
//       ),
//       body: screens[BottmBarIndex.bottombarindex],
//     );
//   }
// }

// List<Widget> screens = [DashBoard(), Favorites(), RewardScreen(), Profile()];

class Bottom_Navigation_Bar extends StatefulWidget {
  const Bottom_Navigation_Bar({super.key});

  @override
  State<Bottom_Navigation_Bar> createState() => _Bottom_Navigation_BarState();
}

class _Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
  final List<Widget> _screens = [
    DashBoard(),
    Favorites(),
    RewardScreen(),
    Profile() // Add more screens as needed
  ];

  @override
  Widget build(BuildContext context) {
    final bools = Provider.of<boolsProvider>(context);
    bools.loadSwitchValue();
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        currentIndex: bools.bottombarindex,
        onTap: (int index) {
          setState(() {
            bools.bottombarindex = index;
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(
              IconlyBold.category,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text("Home"),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(
              IconlyBold.heart,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text("Favorites"),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Stack(children: [
              Icon(
                IconlyBold.activity,
                color: Theme.of(context).colorScheme.primary,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Container(
                  child: Center(
                    child: Text(
                      '0',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              )
            ]),
            title: Text("Notifications"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(
              IconlyBold.user_2,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _screens[bools.bottombarindex],
    );
  }
}
