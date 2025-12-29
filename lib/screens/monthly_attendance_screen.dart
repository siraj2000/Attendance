import 'package:attendance_system/models/fake_attendance.dart';
import 'package:attendance_system/service/export_service.dart';
import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';

import 'package:attendance_system/widget/custom_live_card.dart';
import 'package:attendance_system/widget/moth_header.dart';
import 'package:attendance_system/widget/text_custom.dart';
import 'package:flutter/material.dart';

class MonthlyAttendanceScreen extends StatefulWidget {
  const MonthlyAttendanceScreen({super.key});

  @override
  State<MonthlyAttendanceScreen> createState() =>
      _MonthlyAttendanceScreenState();
}

class _MonthlyAttendanceScreenState extends State<MonthlyAttendanceScreen> {
  TextEditingController searchController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> pickMonthYear() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.year, //يبدأ من اختيار السنة
    );

    if (picked != null) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month);
      });
    }
  }

  Future<void> export() async {
    final file = await ExportService.exportCSV(
      data,
      selectedDate.month,
      selectedDate.year,
    );

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("تم حفظ الملف:\n${file.path}")));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            "Attendance",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: CustomText(
                  text: searchController.value.text.isNotEmpty
                      ? searchController.value.text
                      : "Name Empolyee",
                  size: 16,
                ),
              ),
              SizedBox(height: 15),
              MonthHeader(
                selectedDate: selectedDate,
                onPickDate: pickMonthYear,
                onExport: export,
              ),
              const SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) => CustomLiveCard(
                    day: "17",
                    month: "Nov",
                    arrival: "08:22",
                    departure: "10:00",
                    isPresent: true,
                  ),
                  // AttendanceCard(attendance: data[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
