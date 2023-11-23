import 'package:flutter/material.dart';
import 'package:shop_app/constant/appStyle.dart';
import 'package:shop_app/data/vo/shoes_vo.dart';
import 'package:shop_app/widget/cached_network_image_widget.dart';

class HomeTabBarItemsView extends StatelessWidget {
  const HomeTabBarItemsView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.zero,
      controller: _tabController,
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.transparent,
      isScrollable: true,
      labelColor: Colors.white,
      labelStyle: appStyle(24, FontWeight.bold, Colors.white),
      unselectedLabelColor: Colors.grey.withOpacity(0.5),
      tabs: const [
        Tab(
          text: "Men Shoes",
        ),
        Tab(
          text: "Women Shoes",
        ),
        Tab(
          text: "Kids Shoes",
        ),
      ],
    );
  }
}

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.shoe,
  });
  final Shoes shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.white,
            offset: Offset(-2, -2),
            spreadRadius: 1,
          ),
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: CachedNetworkImageWidget(imageUrl: shoe.imageUrl),
    );
  }
}
