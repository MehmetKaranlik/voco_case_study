import 'package:voco_case_study/feature/login/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:voco_case_study/feature/login/model/login_response.dart';
import 'package:voco_case_study/product/base/api_base_error.dart';
import 'package:voco_case_study/product/extensions/response_extensions.dart';
import 'package:voco_case_study/product/init/networking/network_paths.dart';

abstract class ILoginService {
  Future<(LoginResponse?, ApiBaseError?)> login(LoginModel model);
}

class LoginService extends ILoginService {
  @override
  Future<(LoginResponse?, ApiBaseError?)> login(LoginModel model) async {
    final client = http.Client();

    final response = await client.post(
      NetworkPaths.login.uri,
      body: model.toJson(),
    );
    final (map, error) = response.toMap();
    if (error != null) {
      return (null, error);
    } else {
      return (LoginResponse.fromJson(map ?? {}), null);
    }
  }
}
