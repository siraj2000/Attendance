import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
import 'package:attendance_system/widget/states_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> buildCards() {
    return const [
      StatsCard(
        title: 'Synced Devices',
        value: '2',
        icon: Icons.monitor,
        iconColor: AppColors.dashboardGreenIcon,
        gradient: AppColors.devicesGradient,
      ),
      StatsCard(
        title: 'Synced Logs',
        value: '34,802',
        icon: Icons.description,
        iconColor: AppColors.dashboardRedIcon,
        gradient: AppColors.logsGradient,
      ),
      StatsCard(
        title: 'Synced Employees',
        value: '77',
        icon: Icons.people,
        iconColor: AppColors.dashboardBlueIcon,
        gradient: AppColors.employeesGradient,
      ),
      StatsCard(
        title: 'Inside Company',
        value: '66',
        icon: Icons.file_download_outlined,
        iconColor: AppColors.dashboardGreenIcon,
        gradient: AppColors.insideCompanyGradient,
      ),
      StatsCard(
        title: 'Outside Company',
        value: '34',
        icon: Icons.file_upload_outlined,
        iconColor: AppColors.dashboardRedIcon,
        gradient: AppColors.outsideCompanyGradient,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cards = buildCards();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: cards.length,
        itemBuilder: (context, index) => cards[index],
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}
