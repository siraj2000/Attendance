import 'package:attendance_system/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,

      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            // ===== Title =====
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "SIB Attendance System",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),

            // ===== Dashboard (عادي) =====
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Dashboard"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.white,

              onTap: () {
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
            ),

            const SizedBox(height: 6),

            // ===== Lists (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.people_outline),
              title: const Text("Lists"),
              trailing: const Icon(Icons.keyboard_arrow_down),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [drawerSubItem(context, title: "Employees")],
            ),
            // Divider(height: 1, color: Colors.green),
            // ===== Attendance (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.calendar_month),
              title: const Text("Attendance"),
              trailing: const Icon(Icons.keyboard_arrow_down),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [
                drawerSubItem(context, title: "Monthly Attendance Report"),
                drawerSubItem(context, title: "Employee Attendance Tracking"),
                drawerSubItem(context, title: "Work Schedules"),
              ],
            ),

            // ===== Synchronization (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.sync),
              title: const Text("Synchronization"),
              trailing: const Icon(Icons.keyboard_arrow_down),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [drawerSubItem(context, title: "Management")],
            ),
          ],
        ),
      ),
    );
  }

  // ===== Sub Item =====
  Widget drawerSubItem(BuildContext context, {required String title}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 14)),
      onTap: () {
        Navigator.pop(context); // يقفل Drawer
        // Navigator.push(...) ← حط التنقل هنا
      },
    );
  }
}
