import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:todo_app/screens/cart/cart_history.dart';
import 'package:todo_app/screens/home/main_car_page.dart';
import 'package:todo_app/utilis/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  late PersistentTabController _controller;
  late bool _hideNavBar;

  void onTapNav(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(
        alignment: Alignment.center,
        child: Text('Next Page'),
      ),
      CartHistory(),
      Container(
        alignment: Alignment.center,
        child: Text('Next Next Next Page'),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox),
        title: ("Archive"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
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
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: page[selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedItemColor: AppColors.mainColor,
  //       unselectedItemColor: AppColors.iconColor1,
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       currentIndex: selectedIndex,
  //       onTap: onTapNav,
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.home_outlined), label: '', tooltip: 'Home'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.archive), label: '', tooltip: 'Archive'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.shopping_cart_checkout_outlined),
  //             label: '',
  //             tooltip: 'Cart'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.person), label: '', tooltip: 'Person')
  //       ],
  //     ),
  //   );
  // }

