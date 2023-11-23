import 'package:shop_app/data/vo/shoes_vo.dart';

abstract class ShoesModel {
  ///shoes list
  List<Shoes> getMenShoes();
  List<Shoes> getWomenShoes();
  List<Shoes> getKidsShoes();

  ///single shoe by id
  Shoes getMenShoeById(String shoeId);
  Shoes getWomenShoeById(String shoeId);
  Shoes getKidShoeById(String shoeId);
}
