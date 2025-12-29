import 'package:attendance_system/models/attendance.dart';
import 'package:attendance_system/models/fake_attendance.dart';
import 'package:attendance_system/service/export_service.dart';
import 'package:attendance_system/widget/attendance_card.dart';
import 'package:attendance_system/widget/moth_header.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
    return Scaffold(
      backgroundColor: const Color(0xfff3f5f7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("Attendance", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            MonthHeader(
              selectedDate: selectedDate,
              onPickDate: pickMonthYear,
              onExport: export,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) =>
                    AttendanceCard(attendance: data[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
