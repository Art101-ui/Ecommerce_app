import 'package:get/get.dart';
import 'package:todo_app/data/repository/cartRepo.dart';
import 'package:todo_app/models/cart_models.dart';
import 'package:todo_app/models/product_models.dart';
import 'package:todo_app/utilis/colors.dart';

class CartControllers extends GetxController {
  final CartRepo cartRepo;

  CartControllers({required this.cartRepo});

  Map<int, CartModel> _items = {};

  List<CartModel> storageItems = [];

  Map<int, CartModel> get items => _items;
  int _totalQuantity = 0;

  void addItems(ProductsModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        _totalQuantity = quantity + value.quantity!;

        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            isExist: value.isExist,
            quantity: quantity + value.quantity!,
            time: value.time,
            product: product);
      });
      if (_totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              isExist: true,
              quantity: quantity,
              time: DateTime.now().toString(),
              product: product);
        });
      } else {
        Get.snackbar('Item count', 'Please add at least one item',
            backgroundColor: AppColors.buttonBackgroundColor);
      }
    }

    _items.forEach((key, value) {
      print(value.quantity);
    });

    cartRepo.addCartToList(getItems);
    update();
  }

  void addCartToList() {
    cartRepo.addCartToList(getItems);
    update();
  }

  bool existInCart(ProductsModel productModel) {
    if (_items.containsKey(productModel.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductsModel productsModel) {
    int quantity = 0;
    if (_items.containsKey(productsModel.id)) {
      _items.forEach((key, value) {
        if (key == productsModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    int totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get getTotalAmount {
    int total = 0;

    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }

  List<CartModel> getCartTotal() {
    setCart = cartRepo.getCartList();
    print('Length of item in storage' + storageItems.length.toString());
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    print('Length of item in storage' + storageItems.length.toString());
    for (var i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  set orderTime(Map<int, CartModel> items) {
    _items = {};
    _items = items;
  }

  void addToCartHistoryList() {
    cartRepo.addToCartHistory();
    clear();
  }

  List<CartModel> getToCartHistory() {
    return cartRepo.getCartHistoryList();
  }

  void clear() {
    _items = {};
    update();
  }

  void clearCartHistory() {
    cartRepo.clearCartHistory();
  }
}
