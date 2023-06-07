class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductsModel> _products;
  List<ProductsModel> get products => _products;

  Product(
      {required totalSize,
      required typeId,
      required offset,
      required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = (json['total_size'] ?? 0) as int;
    _typeId = (json['type_id'] ?? 0) as int;
    _offset = (json['offset'] ?? 0) as int;
    if (json['products'] != null) {
      _products = <ProductsModel>[];
      json['products'].forEach((v) {
        _products.add(ProductsModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['total_size'] = totalSize;
  //   data['type_id'] = typeId;
  //   data['offset'] = offset;
  //   if (products != null) {
  //     data['products'] = products!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ProductsModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductsModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.typeId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = (json['id'] ?? 0) as int;
    name = (json['name'] ?? '').toString();
    description = (json['description'] ?? '').toString();
    price = (json['price'] ?? 0) as int;
    stars = (json['stars'] ?? 0) as int;
    img = (json['img'] ?? '').toString();
    location = (json['location'] ?? '').toString();
    createdAt = (json['created_at'] ?? '').toString();
    updatedAt = (json['updated_at'] ?? '').toString();
    typeId = (json['type_id'] ?? 0) as int;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "stars": stars,
      "img": img,
      "location": location,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "type_id": typeId,
    };
  }
}
