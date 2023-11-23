import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_app/constant/appStyle.dart';
import 'package:shop_app/data/vo/shoes_vo.dart';
import 'package:shop_app/view_items/home_page_view_items/home_page_view_items.dart';
import 'package:shop_app/widget/products_by_cart.dart';
import 'package:shop_app/widget/products_cart.dart';

class HomeShoesCategoryWidget extends StatelessWidget {
  const HomeShoesCategoryWidget({
    super.key,
    required this.shoesList,
  });

  final List<Shoes> shoesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              final menShoes = shoesList[index];
              return ProductsCart(
                name: menShoes.shoeName,
                category: menShoes.category,
                id: menShoes.id,
                imageUrl: menShoes.imageUrl,
                price: '\$${menShoes.price}',
              );
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes ",
                    style: appStyle(
                      24,
                      FontWeight.bold,
                      Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductsByCart(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appStyle(
                            22,
                            FontWeight.w500,
                            Colors.black,
                          ),
                        ),
                        const Icon(AntDesign.caretright)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.138,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  final shoe = shoesList[index];
                  return NewShoes(
                    shoe: shoe,
                  );
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
