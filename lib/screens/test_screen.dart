import 'package:attendance_system/models/users_models.dart';
import 'package:attendance_system/widget/custom_search.dart';
import 'package:attendance_system/widget/empolyee_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  Future<List<UserModel>> getUsers() async {
    final dio = Dio();
    final res = await dio.get("https://dummyjson.com/users");

    final list = (res.data['users'] as List);
    return list
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return EmployeeCard(usersMap: users[index]);
            },
          );
        },
      ),
    );
  }
}
