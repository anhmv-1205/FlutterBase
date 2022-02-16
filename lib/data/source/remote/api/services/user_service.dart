import 'package:flutter_base_project/data/model/api_response/base_response.dart';
import 'package:flutter_base_project/data/model/api_response/login_response.dart';
import 'package:flutter_base_project/data/source/remote/api/base_api_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserService extends BaseApiService {
  Future<BaseResponse<LoginResponse>> login(String username, String password) async {
    return request(
      method: Method.post,
      path: 'auth/app/login',
      body: {
        'tendn': username,
        'matkhau': password,
      },
      hasTokenAuthentication: false,
      decoder: LoginResponse.fromJson,
    );
  }
}
