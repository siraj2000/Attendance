// import 'package:attendance_system/models/employee_model.dart';
// import 'package:attendance_system/models/fake_employee.dart';
// import 'package:attendance_system/widget/empolyee_card.dart';
// import 'package:attendance_system/widget/text_custom.dart';
// import 'package:flutter/material.dart';

// class CustomSearch extends SearchDelegate {
//   final List<Employee> all = employees;

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = "";
//           close(context, null);
//         },
//         icon: Icon(Icons.close),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Text("jbuifbuiodfb");
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // لو مربع البحث فاضي نعرض الكل
//     final List<Employee> results = query.isEmpty
//         ? all
//         : all.where((employee) {
//             return employee.fullName.contains(query) || // بحث بالاسم
//                 employee.id.toString().contains(query) || // بحث بالـ id
//                 employee.code.toString().contains(query); // بحث بالـ code
//           }).toList();
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) => EmployeeCard(
//         usersMap: results[index],
//       ), //EmployeeCard(employee: results[index]),
//     );
//   }
// }
import 'package:attendance_system/l10n/app_localizations.dart';
import 'package:attendance_system/models/users_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate<UserModel?> {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<List<UserModel>> _searchUsers(String q) async {
    final res = await _dio.get(
      '/users/search',
      queryParameters: {'q': q, 'limit': 20},
    );

    final List list = (res.data['users'] as List? ?? []);
    return list
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = '';
        showSuggestions(context);
      },
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final q = query.trim();

    if (q.isEmpty) {
      return Center(child: Text(l10n.typeNameToSearch));
    }

    return FutureBuilder<List<UserModel>>(
      future: _searchUsers(q),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("${l10n.error}: ${snapshot.error}"));
        }

        final results = snapshot.data ?? [];
        if (results.isEmpty) return Center(child: Text(l10n.noResults));

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, i) {
            final user = results[i];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(user.image)),
              title: Text("${user.firstName} ${user.lastName}"),
              subtitle: Text(user.email),
              onTap: () {
                // ترجع اليوزر للشاشة اللي نادَت showSearch
                close(context, user);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // نفس suggestions (أو تقدر تخصصها)
    return buildSuggestions(context);
  }
}
