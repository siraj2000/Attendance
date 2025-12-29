import 'package:attendance_system/models/employee_model.dart';
import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
import 'package:attendance_system/widget/text_custom.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0.5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            // ===== Employee Number =====
            Expanded(
              child: Container(
                width: 60,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(14),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromARGB(255, 243, 243, 245),
                      child: Text(
                        employee.id.toString(),
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ===== Department =====
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomText(
                      text: employee.fullName,
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: employee.department,
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText(
                      text: "Code",
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    CustomText(
                      text: employee.code.toString(),
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
