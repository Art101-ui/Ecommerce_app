import 'package:get/get.dart';
import 'package:todo_app/data/controllers/cartControllers.dart';
import 'package:todo_app/data/repository/popularRepo.dart';
import 'package:todo_app/models/cart_models.dart';
import 'package:todo_app/models/product_models.dart';
import 'package:todo_app/utilis/colors.dart';

class ProductControllers extends GetxController {
  final PopularProductRepo repo;

  ProductControllers({required this.repo});
  List<dynamic> _repoList = [];
  List<dynamic> get repoList => _repoList;

  late CartControllers _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRepoList() async {
    Response response = await repo.getRepoList();
    if (response.statusCode == 200) {
      // To initialize it again so it won't give repeated data
      _repoList = [];
      _repoList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  int _quantity = 0;
  int _CartQuantity = 0;

  int get quantity => _quantity;

  int get CartQuantity => _CartQuantity + _quantity;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int value) {
    if ((_CartQuantity + value) < 0) {
      Get.snackbar('Item count', 'Lowest number reached',
          backgroundColor: AppColors.buttonBackgroundColor);
      if (_CartQuantity > 0) {
        _quantity = -_CartQuantity;
        return _quantity;
      }
      return 0;
    } else if ((_CartQuantity + value) > 20) {
      Get.snackbar('Item count', 'Higest number reached',
          backgroundColor: AppColors.buttonBackgroundColor);
      return 20;
    } else {
      return value;
    }
  }

  void initProduct(ProductsModel products, CartControllers cart) {
    _quantity = 0;
    _CartQuantity = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(products);
    if (exist) {
      _CartQuantity = _cart.getQuantity(products);
      print('The default item count of this product is : ' +
          _CartQuantity.toString());
    }

    print('does the product exist in item : ' + exist.toString());
  }

  void addItems(ProductsModel productsModel) {
    print(_quantity);
    _cart.addItems(productsModel, _quantity);
    _quantity = 0;

    _CartQuantity = _cart.getQuantity(productsModel);
    _cart.items.forEach((key, value) {
      print(
          'This item with id of ${value.id} has been added and has a quantity of ${value.quantity}');
    });
    update();
  }

  int totalItems() {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
