// import 'package:attendance_system/models/fake_employee.dart';
// import 'package:attendance_system/widget/custom_search.dart';
// import 'package:attendance_system/widget/empolyee_card.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   Response? response;
//   bool isLoading = false;
//   Future<Response> getData() async {
//     Dio dio = Dio();
//     final Response response = await dio.get("https://dummyjson.com/user");
//     print(response);
//     return response;
//   }

//   assinGetData() async {
//     setState(() {
//       isLoading = true;
//     });
//     response = await getData();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     assinGetData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: isLoading
//             ? CircularProgressIndicator()
//             : Text(response!.data["users"][0]["firstName"].toString()),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSearch(context: context, delegate: CustomSearch());
//             },
//             icon: Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           //Row(),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: employees.length,
//               itemBuilder: (context, index) =>
//                   EmployeeCard(employee: employees[index]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:attendance_system/widget/custom_search.dart';
import 'package:attendance_system/widget/empolyee_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  Future<List<dynamic>> getUsers() async {
    final dio = Dio();
    final response = await dio.get("https://dummyjson.com/users");
    return response.data["users"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: CustomSearch());
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
