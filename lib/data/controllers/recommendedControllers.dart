import 'package:get/get.dart';
import 'package:todo_app/data/repository/popularRepo.dart';
import 'package:todo_app/data/repository/recommendedRepo.dart';
import 'package:todo_app/models/product_models.dart';

class RecommendedControllers extends GetxController {
  final RecommendedRepo repo;

  RecommendedControllers({required this.repo});
  List<dynamic> _recommendedList = [];
  List<dynamic> get recommendedList => _recommendedList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRepoList() async {
    Response response = await repo.getRepoList();
    if (response.statusCode == 200) {
      // To initialize it again so it won't give repeated data and to prevent from giving null
      _recommendedList = [];
      _recommendedList.addAll(Product.fromJson(response.body).products);
      print('got recommended');
      _isLoaded = true;
      update();
    } else {}
  }
}
