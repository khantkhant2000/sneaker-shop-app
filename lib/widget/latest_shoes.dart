import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/data/vo/shoes_vo.dart';
import 'package:shop_app/widget/stagger_tile.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required this.shoesList,
  });

  final List<Shoes> shoesList;

  @override
  Widget build(BuildContext context) {
    // using flutter_staggered_grid_view package
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      itemCount: shoesList.length,
      scrollDirection: Axis.vertical,
      staggeredTileBuilder: (index) => StaggeredTile.extent(
          (index % 2 == 0) ? 1 : 1,
          (index % 4 == 1 || index % 4 == 3)
              ? MediaQuery.of(context).size.height * 0.35
              : MediaQuery.of(context).size.height * 0.30),
      itemBuilder: (context, index) {
        final shoe = shoesList[index];
        return StaggerTile(
          imageUrl: shoe.imageUrl,
          name: shoe.shoeName,
          price: "\$${shoe.price}",
        );
      },
    );
  }
}
