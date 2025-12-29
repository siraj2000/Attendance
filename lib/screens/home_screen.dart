import 'package:attendance_system/widget/drawer_items.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 👈 هنا Drawer
      drawer: const AppDrawer(),

      appBar: AppBar(
        title:
            const // ===== Title =====
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "SIB Attendance System",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

        // زر القائمة (☰)
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      body: const Center(child: Text("uguiguig")),
    );
  }
}
