import 'package:get/get.dart';
import 'package:todo_app/data/repository/popularRepo.dart';
import 'package:todo_app/models/product_models.dart';

class ProductControllers extends GetxController {
  final PopularProductRepo repo;

  ProductControllers({required this.repo});
  List<dynamic> _repoList = [];
  List<dynamic> get repoList => _repoList;

  Future<void> getRepoList() async {
    Response response = await repo.getRepoList();
    if (response.statusCode == 200) {
      // To initialize it again so it won't give repeated data
      _repoList = [];
      _repoList.addAll(Product.fromJson(response.body).products);

      update();
    } else {}
  }
}
