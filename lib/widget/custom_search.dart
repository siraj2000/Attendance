import 'package:attendance_system/models/employee_model.dart';
import 'package:attendance_system/models/fake_employee.dart';
import 'package:attendance_system/widget/empolyee_card.dart';
import 'package:attendance_system/widget/text_custom.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  final List<Employee> all = employees;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          close(context, null);
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("jbuifbuiodfb");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // لو مربع البحث فاضي نعرض الكل
    final List<Employee> results = query.isEmpty
        ? all
        : all.where((employee) {
            return employee.fullName.contains(query) || // بحث بالاسم
                employee.id.toString().contains(query) || // بحث بالـ id
                employee.code.toString().contains(query); // بحث بالـ code
          }).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => EmployeeCard(employee: results[index]),
    );
  }
}
