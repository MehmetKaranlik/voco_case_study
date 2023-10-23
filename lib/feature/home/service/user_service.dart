import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:voco_case_study/feature/home/model/user_response.dart';
import 'package:voco_case_study/product/init/networking/network_paths.dart';

abstract class IHomeService {
  Future<UserResponse?> fetchUsers();
}

class HomeService extends IHomeService {
  @override
  Future<UserResponse?> fetchUsers() async {
    final client = http.Client();
    final response = await client.get(NetworkPaths.users.uri);
    if (response.statusCode == HttpStatus.ok) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
