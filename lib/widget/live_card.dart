import 'package:attendance_system/models/attendance.dart';
import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
import 'package:attendance_system/widget/text_custom.dart';
import 'package:flutter/material.dart';

class LiveCard extends StatelessWidget {
  // final Attendance attendance;

  const LiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    // final isPresent = attendance.status == "Present";
    bool isIn = false;

    return Card(
      elevation: 0.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          // ===== Date =====
          Container(
            //width: 60,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(14)),
            ),
            child: Column(
              children: [
                Text(
                  "attendance.day,",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "attendance.month",
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          // ===== Times =====
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(12),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         // CustomText(text: "ARRIVAL", value: attendance.arrival),
          //         // CustomText(text: "DEPARTURE", value: attendance.departure),
          //         row("ARRIVAL", "attendance.arrival"),

          //         row("DEPARTURE", "attendance.departure"),
          //       ],
          //     ),
          //   ),
          // ),

          // ===== Status =====
          // Padding(
          //   padding: const EdgeInsets.only(right: 12),
          //   child: Row(
          //     children: [
          //       Icon(
          //         isIn ? Icons.arrow_upward : Icons.arrow_downward,
          //         size: 18,
          //         color: isIn ? AppColors.presentIcon : AppColors.absentIcon,
          //       ),
          //       const SizedBox(width: 8),
          //       CustomText(
          //         text: "attendance.status",
          //         size: 15,
          //         fontWeight: FontWeight.bold,
          //         color: isIn ? AppColors.presentText : AppColors.absentText,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
