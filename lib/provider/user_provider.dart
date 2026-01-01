import 'package:flutter/material.dart';
import 'package:attendance_system/models/users_models.dart';
import 'package:attendance_system/service/api.dart';

class UserProvider extends ChangeNotifier {
  final Api _api = Api();

  List<UserModel> users = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await _api.get("users");
      final list = res.data['users'] as List;

      users = list
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();

      error = null;
    } catch (e) {
      error = "Failed to load users";
    }

    isLoading = false;
    notifyListeners();
  }
}
