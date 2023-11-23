import 'package:shop_app/data/model/shoes_model.dart';
import 'package:shop_app/data/vo/shoes_vo.dart';
import 'package:shop_app/network/data_agent/shoe_data_agent/kids_shoes.dart';
import 'package:shop_app/network/data_agent/shoe_data_agent/men_shoes.dart';
import 'package:shop_app/network/data_agent/shoe_data_agent/women_shoe.dart';

class ShoesModelImpl extends ShoesModel {
  //singleton pattern
  ShoesModelImpl._();
  static final ShoesModelImpl _singleton = ShoesModelImpl._();
  factory ShoesModelImpl() => _singleton;

  @override
  List<Shoes> getKidsShoes() => kidShoes;

  @override
  List<Shoes> getWomenShoes() => womenShoes;

  @override
  List<Shoes> getMenShoes() => menShoes;

  @override
  Shoes getKidShoeById(String shoeId) {
    final singleKidShoe = kidShoes.firstWhere((shoe) => shoe.id == shoeId);
    return singleKidShoe;
  }

  @override
  Shoes getMenShoeById(String shoeId) {
    final singleMenShoe = menShoes.firstWhere((shoe) => shoe.id == shoeId);
    return singleMenShoe;
  }

  @override
  Shoes getWomenShoeById(String shoeId) {
    final singleWomenShoe = womenShoes.firstWhere((shoe) => shoe.id == shoeId);
    return singleWomenShoe;
  }
}
