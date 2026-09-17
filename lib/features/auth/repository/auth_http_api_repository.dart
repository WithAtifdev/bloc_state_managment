import '../../../core/network/base_api_services.dart';
import '../../../core/network/network_api_services.dart';
import '../../../core/res/constants/app_url.dart';
import '../model/user_model.dart';
import 'auth_api_repository.dart';


class AuthHttpApiRepository implements AuthApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<UserModel> loginApi(dynamic data) async {
    dynamic response = await _apiServices.postApi(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response);
  }
}
