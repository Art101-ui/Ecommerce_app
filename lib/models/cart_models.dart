import 'package:todo_app/models/product_models.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  bool? isExist;
  String? img;
  String? time;
  ProductsModel? product;

  CartModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.img,
      required this.isExist,
      required this.quantity,
      required this.time,
      required this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = (json['id'] ?? 0) as int;
    name = (json['name'] ?? '').toString();
    isExist = json['isExist'];
    quantity = json['quantity'];
    price = (json['price'] ?? 0) as int;
    img = (json['img'] ?? '').toString();
    time = (json['time'] ?? '').toString();
    product = (ProductsModel.fromJson(json['products']));
  }
}
