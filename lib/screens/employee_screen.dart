// import 'package:attendance_system/models/fake_employee.dart';
// import 'package:attendance_system/widget/custom_search.dart';
// import 'package:attendance_system/widget/empolyee_card.dart';

// import 'package:flutter/material.dart';

// class EmployeeScreen extends StatefulWidget {
//   const EmployeeScreen({super.key});

//   @override
//   State<EmployeeScreen> createState() => _EmployeeScreenState();
// }

// class _EmployeeScreenState extends State<EmployeeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Empolyee"),
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
