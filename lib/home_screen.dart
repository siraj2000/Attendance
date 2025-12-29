// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // class AttendancePage extends StatefulWidget {
// //   const AttendancePage({super.key});

// //   @override
// //   State<AttendancePage> createState() => _AttendancePageState();
// // }

// // class _AttendancePageState extends State<AttendancePage> {
// //   DateTime selectedDate = DateTime(2025, 11);
// //   Future<void> pickMonthYear() async {
// //   final DateTime? picked = await showDatePicker(
// //     context: context,
// //     initialDate: selectedDate,
// //     firstDate: DateTime(2000),
// //     lastDate: DateTime(2100),
// //     initialDatePickerMode: DatePickerMode.year, // يبدأ بالسنة
// //   );

// //   if (picked != null) {
// //     setState(() {
// //       selectedDate = DateTime(picked.year, picked.month);
// //     });
// //   }
// // }
// //   final List<Map<String, String>> data = [
// //     {
// //       "day": "17",
// //       "mon": "NOV",
// //       "in": "08:10 AM",
// //       "out": "10:19 AM",
// //       "status": "Present",
// //     },
// //     {
// //       "day": "16",
// //       "mon": "NOV",
// //       "in": "08:10 AM",
// //       "out": "10:19 AM",
// //       "status": "Present",
// //     },
// //     {
// //       "day": "15",
// //       "mon": "NOV",
// //       "in": "08:10 AM",
// //       "out": "10:19 AM",
// //       "status": "Present",
// //     },
// //     {
// //       "day": "14",
// //       "mon": "NOV",
// //       "in": "00:00",
// //       "out": "00:00",
// //       "status": "Absent",
// //     },
// //     {
// //       "day": "13",
// //       "mon": "NOV",
// //       "in": "08:10 AM",
// //       "out": "10:19 AM",
// //       "status": "Present",
// //     },
// //   ];

// //   Future<void> exportCSV() async {
// //     await Permission.storage.request();

// //     final dir = await getExternalStorageDirectory();
// //     final file = File('${dir!.path}/attendance_nov_2025.csv');

// //     final buffer = StringBuffer();
// //     buffer.writeln("Date,Month,Arrival,Departure,Status");

// //     for (var e in data) {
// //       buffer.writeln(
// //         "${e['day']},${e['mon']},${e['in']},${e['out']},${e['status']}",
// //       );
// //     }

// //     await file.writeAsString(buffer.toString());

// //     if (!mounted) return;
// //     ScaffoldMessenger.of(
// //       context,
// //     ).showSnackBar(SnackBar(content: Text("تم حفظ الملف: ${file.path}")));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xfff3f5f7),

// //       // ===== AppBar =====
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         leading: const BackButton(color: Colors.black),
// //         title: const Text(
// //           "Attendance",
// //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
// //         ),
// //         centerTitle: true,
// //         actions: const [
// //           Padding(
// //             padding: EdgeInsets.only(right: 16),
// //             child: Icon(Icons.menu, color: Colors.black),
// //           ),
// //         ],
// //       ),

// //       // ===== Body =====
// //       body: Padding(
// //         padding: const EdgeInsets.all(12),
// //         child: Column(
// //           children: [
// //             // Month + Export
// //             Container(
// //               padding: const EdgeInsets.all(12),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(14),
// //                 border: Border.all(color: Colors.grey.shade300),
// //               ),
// //               child: Row(
// //                 children: [
// //                   const Icon(Icons.calendar_month, color: Colors.indigo),
// //                   const SizedBox(width: 8),
// //                   const Expanded(
// //                     child: Text(
// //                       "November, 2025",
// //                       style: TextStyle(fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                   TextButton(
// //                     onPressed: exportCSV,
// //                     child: const Text(
// //                       "Export",
// //                       style: TextStyle(fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 12),

// //             // List
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: data.length,
// //                 itemBuilder: (context, i) {
// //                   final e = data[i];
// //                   final isAbsent = e["status"] == "Absent";

// //                   return Card(
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(14),
// //                     ),
// //                     margin: const EdgeInsets.only(bottom: 10),
// //                     child: Row(
// //                       children: [
// //                         // Date
// //                         Container(
// //                           width: 60,
// //                           padding: const EdgeInsets.symmetric(vertical: 14),
// //                           decoration: BoxDecoration(
// //                             color: isAbsent
// //                                 ? Colors.red.shade100
// //                                 : Colors.green.shade100,
// //                             borderRadius: const BorderRadius.horizontal(
// //                               left: Radius.circular(14),
// //                             ),
// //                           ),
// //                           child: Column(
// //                             children: [
// //                               Text(
// //                                 e["day"]!,
// //                                 style: const TextStyle(
// //                                   fontSize: 18,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 e["mon"]!,
// //                                 style: const TextStyle(fontSize: 11),
// //                               ),
// //                             ],
// //                           ),
// //                         ),

// //                         // Info
// //                         Expanded(
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(12),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 row("ARRIVAL", e["in"]!),
// //                                 row("DEPARTURE", e["out"]!),
// //                               ],
// //                             ),
// //                           ),
// //                         ),

// //                         // Status
// //                         Padding(
// //                           padding: const EdgeInsets.only(right: 12),
// //                           child: Container(
// //                             padding: const EdgeInsets.symmetric(
// //                               horizontal: 12,
// //                               vertical: 6,
// //                             ),
// //                             decoration: BoxDecoration(
// //                               color: isAbsent
// //                                   ? Colors.red.shade200
// //                                   : Colors.green.shade200,
// //                               borderRadius: BorderRadius.circular(20),
// //                             ),
// //                             child: Text(
// //                               e["status"]!,
// //                               style: const TextStyle(
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),

// //       // ===== Bottom Nav =====
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: 0,
// //         selectedItemColor: Colors.blue,
// //         unselectedItemColor: Colors.grey,
// //         items: const [
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
// //           BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Exam"),
// //           BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
// //           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget row(String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 2),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
// //           Text(
// //             value,
// //             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class AttendancePage extends StatefulWidget {
//   const AttendancePage({super.key});

//   @override
//   State<AttendancePage> createState() => _AttendancePageState();
// }

// class _AttendancePageState extends State<AttendancePage> {
//   DateTime selectedDate = DateTime(2025, 11);

//   final List<Map<String, String>> data = [
//     {
//       "day": "17",
//       "mon": "NOV",
//       "in": "08:10 AM",
//       "out": "10:19 AM",
//       "status": "Present",
//     },
//     {
//       "day": "16",
//       "mon": "NOV",
//       "in": "08:10 AM",
//       "out": "10:19 AM",
//       "status": "Present",
//     },
//     {
//       "day": "15",
//       "mon": "NOV",
//       "in": "08:10 AM",
//       "out": "10:19 AM",
//       "status": "Present",
//     },
//     {
//       "day": "14",
//       "mon": "NOV",
//       "in": "00:00",
//       "out": "00:00",
//       "status": "Absent",
//     },
//     {
//       "day": "13",
//       "mon": "NOV",
//       "in": "08:10 AM",
//       "out": "10:19 AM",
//       "status": "Present",
//     },
//   ];

//   // ================== Date Picker ==================
//   Future<void> pickMonthYear() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       initialDatePickerMode: DatePickerMode.year,
//     );

//     if (picked != null) {
//       setState(() {
//         selectedDate = DateTime(picked.year, picked.month);
//       });
//     }
//   }

//   // ================== Export CSV ==================
//   Future<void> exportCSV() async {
//     await Permission.storage.request();

//     final dir = await getExternalStorageDirectory();
//     final file = File(
//       '${dir!.path}/attendance_${selectedDate.month}_${selectedDate.year}.csv',
//     );

//     final buffer = StringBuffer();
//     buffer.writeln("Date,Month,Arrival,Departure,Status");

//     for (var e in data) {
//       buffer.writeln(
//         "${e['day']},${e['mon']},${e['in']},${e['out']},${e['status']}",
//       );
//     }

//     await file.writeAsString(buffer.toString());

//     if (!mounted) return;
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("تم حفظ الملف:\n${file.path}")));
//   }

//   // ================== UI ==================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff3f5f7),

//       // ===== AppBar =====
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: const BackButton(color: Colors.black),
//         centerTitle: true,
//         title: const Text(
//           "Attendance",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16),
//             child: Icon(Icons.menu, color: Colors.black),
//           ),
//         ],
//       ),

//       // ===== Body =====
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             // Month + Export
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(14),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.calendar_month,
//                       color: Colors.indigo,
//                     ),
//                     onPressed: pickMonthYear,
//                   ),

//                   Expanded(
//                     child: Text(
//                       "${monthName(selectedDate.month)}, ${selectedDate.year}",
//                       style: const TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ),

//                   TextButton(
//                     onPressed: exportCSV,
//                     child: const Text(
//                       "Export",
//                       style: TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // Attendance List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   final e = data[index];
//                   final isAbsent = e["status"] == "Absent";

//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     margin: const EdgeInsets.only(bottom: 10),
//                     child: Row(
//                       children: [
//                         // Date Column
//                         Container(
//                           width: 60,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           decoration: BoxDecoration(
//                             color: isAbsent
//                                 ? Colors.red.shade100
//                                 : Colors.green.shade100,
//                             borderRadius: const BorderRadius.horizontal(
//                               left: Radius.circular(14),
//                             ),
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 e["day"]!,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 e["mon"]!,
//                                 style: const TextStyle(fontSize: 11),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Info
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 infoRow("ARRIVAL", e["in"]!),
//                                 infoRow("DEPARTURE", e["out"]!),
//                               ],
//                             ),
//                           ),
//                         ),

//                         // Status
//                         Padding(
//                           padding: const EdgeInsets.only(right: 12),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: isAbsent
//                                   ? Colors.red.shade200
//                                   : Colors.green.shade200,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               e["status"]!,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),

//       // ===== Bottom Nav =====
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Exam"),
//           BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
//         ],
//       ),
//     );
//   }

//   // ================== Helpers ==================
//   Widget infoRow(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
//           Text(
//             value,
//             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//     );
//   }

//   String monthName(int month) {
//     const months = [
//       "January",
//       "February",
//       "March",
//       "April",
//       "May",
//       "June",
//       "July",
//       "August",
//       "September",
//       "October",
//       "November",
//       "December",
//     ];
//     return months[month - 1];
//   }
// }
