import 'dart:io';
import 'package:attendance_system/models/attendance.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ExportService {
  static Future<File> exportCSV(
    List<Attendance> data,
    int month,
    int year,
  ) async {
    await Permission.storage.request(); //صلاحية التخزين

    final dir = await getExternalStorageDirectory(); //نجيب مسار التخزين

    final file = File(
      '${dir!.path}/attendance_${month}_$year.csv',
    ); //ننشئ ملف CSV باسم الشهر والسنة

    final buffer = StringBuffer();
    buffer.writeln("Date,Month,Arrival,Departure,Status");

    for (var e in data) {
      buffer.writeln(
        "${e.day},${e.month},${e.arrival},${e.departure},${e.status}",
      );
    }

    return file.writeAsString(buffer.toString());
  }
}
