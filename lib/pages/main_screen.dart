import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:shop_app/pages/profile_page.dart';
import 'package:shop_app/pages/search_page.dart';
import 'package:shop_app/provider/main_screen_notifier.dart';
import 'package:shop_app/widget/bottom_nav_widget.dart';
import 'package:shop_app/widget/products_by_cart.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    ProductsByCart(),
    CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavWidget(
                      onTap: () {
                        mainScreenNotifier.newIndex = 0;
                      },
                      icon: mainScreenNotifier.pageIndex == 0
                          ? MaterialCommunityIcons.home
                          : MaterialCommunityIcons.home_outline,
                    ),
                    BottomNavWidget(
                      onTap: () {
                        mainScreenNotifier.newIndex = 1;
                      },
                      icon: mainScreenNotifier.pageIndex == 1
                          ? Ionicons.search
                          : Ionicons.search_outline,
                    ),
                    BottomNavWidget(
                      onTap: () {
                        mainScreenNotifier.newIndex = 2;
                      },
                      icon: mainScreenNotifier.pageIndex == 2
                          ? Ionicons.add_circle_outline
                          : Ionicons.add_outline,
                    ),
                    BottomNavWidget(
                      onTap: () {
                        mainScreenNotifier.newIndex = 3;
                      },
                      icon: mainScreenNotifier.pageIndex == 3
                          ? Ionicons.cart
                          : Ionicons.cart_outline,
                    ),
                    BottomNavWidget(
                      onTap: () {
                        mainScreenNotifier.newIndex = 4;
                      },
                      icon: mainScreenNotifier.pageIndex == 4
                          ? Ionicons.person
                          : Ionicons.person_outline,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
