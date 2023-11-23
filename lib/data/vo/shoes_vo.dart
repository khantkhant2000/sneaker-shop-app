import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Shoes {
  final String id;
  final String shoeName;
  final String category;
  final String imageUrl;
  final String price;

  Shoes({
    required this.shoeName,
    required this.category,
    required this.imageUrl,
    required this.price,
  }) : id = uuid.v4();
}
