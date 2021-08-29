import 'package:flutter/material.dart';
import 'package:hacker_kernel/trending_tab.dart';
import 'package:hacker_kernel/youtube_tab.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dashboard.dart';

class PersistantBottomNav extends StatefulWidget {
  static PersistentTabController controller =
  PersistentTabController(initialIndex: 0);

  static void changeTab() {
    PersistantBottomNav.controller.jumpToTab(2);
  }

  @override
  _PersistantBottomNavState createState() => _PersistantBottomNavState();
}

class _PersistantBottomNavState extends State<PersistantBottomNav> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistantBottomNav.controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      // bottomScreenMargin: 0.2,
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
      true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
      true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      navBarStyle:
      NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      DashBoard(),
       Trending(),
       Youtube(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon: Icon(Icons.home,color: Colors.blue,size: 30,),
        inactiveIcon:  Icon(Icons.home,color: Colors.black,size: 30,),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list,color: Colors.blue,size: 30,),
        inactiveIcon: Icon(Icons.list,color: Colors.black,),
        ),

      PersistentBottomNavBarItem(
      icon: Icon(Icons.play_circle_filled,color: Colors.blue,size: 30,),
    inactiveIcon: Icon(Icons.play_circle_filled,color: Colors.black,),
    ),
    ];
  }
}




