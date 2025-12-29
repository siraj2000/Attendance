// import 'package:attendance_system/models/attendance.dart';
// import 'package:attendance_system/models/fake_employee.dart';
// import 'package:attendance_system/widget/live_card.dart';
// import 'package:flutter/material.dart';

// class LiveScreen extends StatefulWidget {
//   const LiveScreen({super.key});

//   @override
//   State<LiveScreen> createState() => _LiveScreenState();
// }

// class _LiveScreenState extends State<LiveScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff3f5f7),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         title: const Text("Attendance", style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             const SizedBox(height: 12),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: employees.length,
//                 itemBuilder: (context, i) => LiveCard(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum AttendanceStatus { present, absent }

class AttendanceSession {
  final TimeOfDay inTime;
  final TimeOfDay? outTime; // null = لسه داخل
  AttendanceSession({required this.inTime, this.outTime});
}

class EmployeeDailyAttendance {
  final String employeeName;
  final DateTime date;
  final AttendanceStatus status;
  final List<AttendanceSession> sessions;

  const EmployeeDailyAttendance({
    required this.employeeName,
    required this.date,
    required this.status,
    required this.sessions,
  });

  int get punchesCount => sessions.length; // عدد مرات الدخول (تقريباً)
  bool get isMultiPunch => sessions.length >= 2;
}

class LiveAttendanceStaticPage extends StatefulWidget {
  const LiveAttendanceStaticPage({super.key});

  @override
  State<LiveAttendanceStaticPage> createState() =>
      _LiveAttendanceStaticPageState();
}

class _LiveAttendanceStaticPageState extends State<LiveAttendanceStaticPage> {
  final _searchCtrl = TextEditingController();
  bool _showOnlyMultiPunch = true;

  // Dummy day (زي الصورة 13-17 NOV)
  final DateTime _day = DateTime(2025, 11, 17);

  late final List<EmployeeDailyAttendance> _data = [
    EmployeeDailyAttendance(
      employeeName: 'Ahmed Ali',
      date: DateTime(2025, 11, 17),
      status: AttendanceStatus.present,
      sessions: [
        AttendanceSession(
          inTime: const TimeOfDay(hour: 8, minute: 10),
          outTime: const TimeOfDay(hour: 10, minute: 19),
        ),
        AttendanceSession(
          inTime: const TimeOfDay(hour: 11, minute: 5),
          outTime: const TimeOfDay(hour: 12, minute: 45),
        ),
      ],
    ),
    EmployeeDailyAttendance(
      employeeName: 'Salma Omar',
      date: DateTime(2025, 11, 16),
      status: AttendanceStatus.present,
      sessions: [
        AttendanceSession(
          inTime: const TimeOfDay(hour: 8, minute: 10),
          outTime: const TimeOfDay(hour: 10, minute: 19),
        ),
      ],
    ),
    EmployeeDailyAttendance(
      employeeName: 'Yousef Hassan',
      date: DateTime(2025, 11, 15),
      status: AttendanceStatus.present,
      sessions: [
        AttendanceSession(
          inTime: const TimeOfDay(hour: 8, minute: 10),
          outTime: const TimeOfDay(hour: 10, minute: 19),
        ),
        AttendanceSession(
          inTime: const TimeOfDay(hour: 10, minute: 50),
          outTime: const TimeOfDay(hour: 13, minute: 5),
        ),
        AttendanceSession(
          inTime: const TimeOfDay(hour: 14, minute: 20),
        ), // لسه داخل
      ],
    ),
    EmployeeDailyAttendance(
      employeeName: 'Mona Saleh',
      date: DateTime(2025, 11, 14),
      status: AttendanceStatus.absent,
      sessions: [
        AttendanceSession(
          inTime: const TimeOfDay(hour: 8, minute: 10),
          // outTime: const TimeOfDay(hour: 10, minute: 19),
        ),
      ],
    ),
    EmployeeDailyAttendance(
      employeeName: 'Khaled Ibrahim',
      date: DateTime(2025, 11, 13),
      status: AttendanceStatus.present,
      sessions: [
        AttendanceSession(
          inTime: const TimeOfDay(hour: 8, minute: 10),
          outTime: const TimeOfDay(hour: 10, minute: 19),
        ),
        AttendanceSession(
          inTime: const TimeOfDay(hour: 10, minute: 35),
          outTime: const TimeOfDay(hour: 11, minute: 55),
        ),
      ],
    ),
  ];

  String _fmtTime(TimeOfDay t) {
    final dt = DateTime(2025, 1, 1, t.hour, t.minute);
    return DateFormat('hh:mm a').format(dt);
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final monthTitle = DateFormat('MMMM, yyyy').format(_day);
    final query = _searchCtrl.text.trim().toLowerCase();

    final filtered = _data.where((e) {
      if (_showOnlyMultiPunch && !e.isMultiPunch) return false;
      if (query.isNotEmpty && !e.employeeName.toLowerCase().contains(query))
        return false;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        centerTitle: true,
        title: const Text(
          'Attendance',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          // Month selector bar (Static)
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(18),
          //       border: Border.all(color: Colors.black12),
          //     ),
          //     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          //     child: Row(
          //       children: [
          //         const Icon(Icons.calendar_month, color: Color(0xFF3B56F6)),
          //         const SizedBox(width: 10),
          //         Expanded(
          //           child: Text(
          //             monthTitle,
          //             style: const TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //             // Static: بعدين تربطها للتصدير
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               const SnackBar(content: Text('Export (static)')),
          //             );
          //           },
          //           child: const Text(
          //             'Export',
          //             style: TextStyle(
          //               color: Color(0xFF6B5CF6),
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // Search + filter
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Search employee...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FilterChip(
                  selected: _showOnlyMultiPunch,
                  label: const Text('Multi-punch'),
                  onSelected: (v) => setState(() => _showOnlyMultiPunch = v),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final item = filtered[i];
                return _AttendanceCard(item: item, fmtTime: _fmtTime);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AttendanceCard extends StatelessWidget {
  const _AttendanceCard({required this.item, required this.fmtTime});

  final EmployeeDailyAttendance item;
  final String Function(TimeOfDay t) fmtTime;

  @override
  Widget build(BuildContext context) {
    final day = item.date.day.toString();
    final mon = DateFormat('MMM').format(item.date).toUpperCase();

    final isPresent = item.status == AttendanceStatus.present;

    final statusColor = isPresent ? Colors.green : Colors.red;
    final statusText = isPresent ? 'insaid' : 'outside';
    final statusIcon = isPresent ? Icons.arrow_upward : Icons.arrow_downward;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left date
          SizedBox(
            width: 52,
            child: Column(
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2F54FF),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  mon,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2F54FF),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Middle details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.employeeName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),

                if (!isPresent) ...[
                  _rowLabelValue('ARRIVAL', '00:00'),
                  const SizedBox(height: 6),
                  _rowLabelValue('DEPARTURE', '00:00'),
                ] else ...[
                  // لو عنده Sessions متعددة نعرضهم واحد ورا التاني
                  for (int idx = 0; idx < item.sessions.length; idx++) ...[
                    _sessionRow(idx + 1, item.sessions[idx]),
                    if (idx != item.sessions.length - 1)
                      const SizedBox(height: 10),
                  ],
                ],
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Right status
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(statusIcon, color: statusColor, size: 22),
              const SizedBox(width: 6),
              Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rowLabelValue(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 92,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }

  Widget _sessionRow(int sessionNo, AttendanceSession s) {
    final inStr = fmtTime(s.inTime);
    final outStr = s.outTime == null ? '--:--' : fmtTime(s.outTime!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session $sessionNo',
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        _rowLabelValue('ARRIVAL', inStr),
        const SizedBox(height: 6),
        _rowLabelValue('DEPARTURE', outStr),
      ],
    );
  }
}
