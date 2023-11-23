import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:shop_app/constant/appStyle.dart';
import 'package:shop_app/data/model/shoes_model.dart';
import 'package:shop_app/data/model/shoes_model_impl.dart';
import 'package:shop_app/data/vo/shoes_vo.dart';
import 'package:shop_app/widget/category_btn.dart';
import 'package:shop_app/widget/custom_spacer.dart';
import 'package:shop_app/widget/latest_shoes.dart';

class ProductsByCart extends StatefulWidget {
  const ProductsByCart({super.key});

  @override
  State<ProductsByCart> createState() => _ProductsByCartState();
}

class _ProductsByCartState extends State<ProductsByCart>
    with TickerProviderStateMixin {
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
              padding: const EdgeInsets.fromLTRB(16, 30, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/top_img.png",
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 6, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:
                              const Icon(AntDesign.close, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: const Icon(FontAwesome.sliders,
                              color: Colors.white),
                          onPressed: filter,
                        ),
                      ],
                    ),
                  ),
                  TabBar(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.21,
                left: 16,
                right: 12,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LatestShoes(shoesList: menShoesList),
                    LatestShoes(shoesList: womenShoesList),
                    LatestShoes(shoesList: kidsShoesList),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.82,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    "Filter",
                    style: appStyle(40, FontWeight.bold, Colors.black),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Gender",
                    style: appStyle(20, FontWeight.bold, Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      CategoryBtn(btnColor: Colors.black, label: "Men"),
                      CategoryBtn(btnColor: Colors.grey, label: "Women"),
                      CategoryBtn(btnColor: Colors.grey, label: "Kids"),
                    ],
                  ),
                  const CustomSpacer(),
                  Text(
                    "Category",
                    style: appStyle(20, FontWeight.bold, Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      CategoryBtn(btnColor: Colors.black, label: "Shoes"),
                      CategoryBtn(btnColor: Colors.grey, label: "Apparrels"),
                      CategoryBtn(btnColor: Colors.grey, label: "Accessories"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
