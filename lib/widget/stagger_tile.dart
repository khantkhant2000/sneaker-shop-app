import 'package:flutter/material.dart';
import 'package:shop_app/widget/cached_network_image_widget.dart';
import 'package:shop_app/widget/easy_text.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
  final String imageUrl;
  final String name;
  final String price;
  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: CachedNetworkImageWidget(
                imageUrl: widget.imageUrl,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            height: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyText(
                  text: widget.name,
                  fs: 20,
                  h: 1,
                  color: Colors.black,
                  fw: FontWeight.w700,
                ),
                const SizedBox(
                  height: 3,
                ),
                EasyText(
                  text: widget.price,
                  fs: 20,
                  h: 1,
                  color: Colors.black,
                  fw: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
