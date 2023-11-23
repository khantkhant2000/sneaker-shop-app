import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shop_app/widget/cached_network_image_widget.dart';
import 'package:shop_app/widget/easy_text.dart';

class ProductsCart extends StatefulWidget {
  const ProductsCart({
    super.key,
    required this.name,
    required this.category,
    required this.id,
    required this.imageUrl,
    required this.price,
  });
  final String name;
  final String category;
  final String id;
  final String imageUrl;
  final String price;
  @override
  State<ProductsCart> createState() => _ProductsCartState();
}

class _ProductsCartState extends State<ProductsCart> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 6, bottom: 6),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 0.6,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.21,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //       widget.imageUrl,
                  //     ),
                  //     fit: BoxFit.fitWidth),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: CachedNetworkImageWidget(imageUrl: widget.imageUrl)),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: IconButton(
                  icon: const Icon(MaterialCommunityIcons.heart_outline),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.085,
                  child: EasyText(
                    text: widget.name,
                    fs: 24,
                    h: 1.1,
                    color: Colors.black,
                  ),
                ),
                EasyText(
                  text: widget.category,
                  fs: 18,
                  h: 1.5,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EasyText(
                  text: widget.price,
                  fs: 28,
                  h: 1,
                  fw: FontWeight.w600,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    const EasyText(
                      text: "Color ",
                      fs: 18,
                      h: 1,
                      fw: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ChoiceChip(
                      label: const Text(""),
                      selected: selected,
                      onSelected: (newValue) {
                        setState(() {
                          selected = newValue;
                        });
                      },
                      selectedColor: Colors.black,
                      visualDensity: VisualDensity.compact,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
