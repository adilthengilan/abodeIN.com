import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/favorite_screen/favorite_screen.dart';
import 'package:abodein/src/view/profile/profile_screen.dart';
import 'package:abodein/src/view/search_page.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class Bottom_Navigation_Bar extends StatelessWidget {
  const Bottom_Navigation_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottmBarIndex = Provider.of<DashBoardProvider>(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CrystalNavigationBar(
          currentIndex: BottmBarIndex.bottombarindex,
          // indicatorColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black45,
          // outlineBorderColor: Colors.black.withOpacity(0.1),
          onTap: (index) {
            BottmBarIndex.setBottomBarindex(index);
          },
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.red,
            ),

            /// Add

            /// Search
            CrystalNavigationBarItem(
                icon: IconlyBold.search,
                unselectedIcon: IconlyLight.search,
                selectedColor: Colors.white),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user,
              selectedColor: const Color.fromARGB(255, 0, 47, 2),
            ),
          ],
        ),
      ),
      body: screens[BottmBarIndex.bottombarindex],
    );
  }
}

List<Widget> screens = [DashBoard(), FavoriteScreen(backButton: false,), SearchScreen(), Profile(), ];