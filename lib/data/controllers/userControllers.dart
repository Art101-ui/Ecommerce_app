import 'package:get/get.dart';
import 'package:todo_app/data/repository/authRepo.dart';
import 'package:todo_app/data/repository/userRepo.dart';
import 'package:todo_app/models/response_model.dart';
import 'package:todo_app/models/signup_model.dart';
import 'package:todo_app/models/user_models.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late UserModel _userModel;

  UserModel get userModel => _userModel;

  Future<ResponseModel> getProfile() async {
    Response response = await userRepo.getProfile();
    print(response.body);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);

      _isLoading = true;
      responseModel = ResponseModel(true, "success");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}
