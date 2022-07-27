import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../utils/app_colors.dart';
import 'cart/cart.dart';
import 'home/home_screen.dart';
import 'orders/screens/order_screen.dart';
import 'search/search.dart';
import 'settings/settings.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);
  PersistentTabController controller = PersistentTabController();
  final List<Widget> _pages = [
    const HomeScreen(),
    SearchScreen(),
    CartAndFavouriteScreen(isCart: true),
    OrderScreen(),
    CartAndFavouriteScreen(isCart: false),
    SettingsScreen(),
  ];
  final List<String> _titles = ['Home', 'Search', 'Cart', 'Settings'];
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
        padding: const NavBarPadding.symmetric(vertical: 0, horizontal: 0),
        screens: _pages,
        margin: EdgeInsets.zero,
        itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200)),
        screenTransitionAnimation:
            const ScreenTransitionAnimation(animateTabTransition: true),
        controller: controller,
        popAllScreensOnTapOfSelectedTab: true,
        hideNavigationBarWhenKeyboardShows: true,
        stateManagement: false,
        popActionScreens: PopActionScreensType.all,
        items: [
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.apps),
              title: 'Home',
              activeColorPrimary: AppColors.primary),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.search),
              title: 'Search',
              activeColorPrimary: AppColors.primary),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.shopping_basket),
              title: 'Cart',
              activeColorPrimary: AppColors.primary),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.money_off_csred_rounded),
              title: 'orders',
              activeColorPrimary: AppColors.primary),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.favorite),
              title: 'Favourites',
              activeColorPrimary: AppColors.primary),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.settings),
              title: 'Categories',
              activeColorPrimary: AppColors.primary)
        ]);
  }
}
