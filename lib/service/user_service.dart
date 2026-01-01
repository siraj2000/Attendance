import 'package:dio/dio.dart';
import '../models/users_models.dart';

class UserService {
  final Dio dio = Dio();

  Future<List<UserModel>> fetchUsers() async {
    final res = await dio.get("https://dummyjson.com/users");
    final list = (res.data['users'] as List);

    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}
