import 'package:attendance_system/l10n/app_localizations.dart';
import 'package:attendance_system/provider/locale_provider.dart';
import 'package:attendance_system/screens/monthly_attendance_screen.dart';
import 'package:attendance_system/screens/dashboard_screen.dart';
import 'package:attendance_system/screens/home_screen.dart';
import 'package:attendance_system/screens/live_screen.dart';
import 'package:attendance_system/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isArabic = localeProvider.locale.languageCode == 'ar';

    return Drawer(
      backgroundColor: Colors.white,

      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            // ===== Title =====
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                l10n.appTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),

            // ===== Dashboard (عادي) =====
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(l10n.dashboard),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.white,

              onTap: () {
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 6),

            // ===== Lists (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.people_outline),
              title: Text(l10n.lists),
              trailing: const Icon(Icons.keyboard_arrow_down),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [
                drawerSubItem(
                  // page: EmployeeScreen(),
                  page: const TestScreen(),
                  context,
                  title: l10n.employees,
                ),
              ],
            ),
            // Divider(height: 1, color: Colors.green),
            // ===== Attendance (Dropdown) =====
            ExpansionTile(
              shape: Border.all(color: Colors.white),
              leading: const Icon(Icons.calendar_month),
              title: Text(l10n.attendance),
              trailing: const Icon(Icons.keyboard_arrow_down),
              childrenPadding: const EdgeInsets.only(left: 32),
              children: [
                drawerSubItem(
                  page: const MonthlyAttendanceScreen(),
                  context,
                  title: l10n.monthlyAttendanceReport,
                ),
                drawerSubItem(
                  page: const LiveScreen(),
                  context,
                  // title: "Employee Attendance Tracking",
                  title: l10n.liveScreen,
                ),
                drawerSubItem(
                  page: const HomeScreen(),
                  context,
                  title: l10n.workSchedules,
                ),
              ],
            ),

            const Divider(height: 32),

            // ===== Language Toggle =====
            ListTile(
              leading: const Icon(Icons.language, color: Colors.indigo),
              title: Text(l10n.language),
              subtitle: Text(isArabic ? l10n.arabic : l10n.english),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.white,
              onTap: () {
                localeProvider.toggleLocale();
                Navigator.pop(context);
              },
              trailing: Icon(
                isArabic ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                size: 16,
              ),
            ),

            // ===== Synchronization (Dropdown) =====
            // ExpansionTile(
            //   shape: Border.all(color: Colors.white),
            //   leading: const Icon(Icons.sync),
            //   title: const Text("Synchronization"),
            //   trailing: const Icon(Icons.keyboard_arrow_down),
            //   childrenPadding: const EdgeInsets.only(left: 32),
            //   children: [drawerSubItem(context, title: "Management")],
            // ),
          ],
        ),
      ),
    );
  }

  // ===== Sub Item =====
  Widget drawerSubItem(
    BuildContext context, {
    required String title,
    required Widget page,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 14)),
      onTap: () {
        // Navigator.pop(context); // يقفل Drawer
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
