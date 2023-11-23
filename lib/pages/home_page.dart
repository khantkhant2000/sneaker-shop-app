import 'package:flutter/material.dart';

import 'package:shop_app/data/model/shoes_model.dart';
import 'package:shop_app/data/model/shoes_model_impl.dart';
import 'package:shop_app/data/vo/shoes_vo.dart';
import 'package:shop_app/view_items/home_page_view_items/home_page_view_items.dart';
import 'package:shop_app/widget/easy_text.dart';
import 'package:shop_app/widget/home_shoes_category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ShoesModel shoesModel = ShoesModelImpl();
  List<Shoes> menShoesList = [];
  List<Shoes> womenShoesList = [];
  List<Shoes> kidsShoesList = [];
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getMenShoesList();
    getWomenShoesList();
    getKidsShoesList();
  }

  void getMenShoesList() {
    menShoesList = shoesModel.getMenShoes();
  }

  void getWomenShoesList() {
    womenShoesList = shoesModel.getWomenShoes();
  }

  void getKidsShoesList() {
    kidsShoesList = shoesModel.getKidsShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white70,
                image: DecorationImage(
                    image: AssetImage(
                      "images/top_img.png",
                    ),
                    fit: BoxFit.fill),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EasyText(text: "Athletics Shoes ", fs: 38, h: 1.5),
                    const EasyText(text: "Collection ", fs: 36, h: 1.2),
                    const SizedBox(
                      height: 6,
                    ),
                    HomeTabBarItemsView(tabController: _tabController),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.265,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomeShoesCategoryWidget(shoesList: menShoesList),
                  HomeShoesCategoryWidget(shoesList: womenShoesList),
                  HomeShoesCategoryWidget(shoesList: kidsShoesList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
