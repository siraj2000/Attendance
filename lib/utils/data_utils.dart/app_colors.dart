import 'package:flutter/material.dart';

class AppColors {
  // ===== Primary =====
  static const Color primary = Colors.indigo;

  // ===== Attendance Status =====
  static const Color presentIcon = Colors.green;
  static const Color absentIcon = Colors.red;

  static const Color presentText = Color.fromARGB(255, 140, 202, 142);
  static const Color absentText = Color.fromARGB(255, 226, 102, 93);

  static const Color presentBackground = Color.fromARGB(255, 220, 235, 221);
  static const Color absentBackground = Color.fromARGB(255, 255, 216, 220);

  // =============================
  // Dashboard Icons
  // =============================
  static const Color dashboardGreenIcon = Colors.green;
  static const Color dashboardRedIcon = Colors.red;
  static const Color dashboardBlueIcon = Colors.blue;

  // =============================
  // Dashboard Gradients
  // =============================

  static const LinearGradient devicesGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xffe2fceb), Color(0xfffdfeff)],
  );

  static const LinearGradient logsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xfffee7e7), Color(0xfffdfeff)],
  );

  static const LinearGradient employeesGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xffe9edff), Color(0xfffdfeff)],
  );

  static const LinearGradient insideCompanyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 191, 189, 206), Color(0xfffdfeff)],
  );
  //تدريج
  static const LinearGradient outsideCompanyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 157, 156, 196), Color(0xfffdfeff)],
  );
}
