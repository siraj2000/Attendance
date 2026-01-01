// import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
// import 'package:attendance_system/widget/states_card.dart';
// import 'package:flutter/material.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Widget> buildCards() {
//     return const [
//       StatsCard(
//         title: 'Synced Devices',
//         value: '2',
//         icon: Icons.monitor,
//         iconColor: AppColors.dashboardGreenIcon,
//         gradient: AppColors.devicesGradient,
//       ),
//       StatsCard(
//         title: 'Synced Logs',
//         value: '34,802',
//         icon: Icons.description,
//         iconColor: AppColors.dashboardRedIcon,
//         gradient: AppColors.logsGradient,
//       ),
//       StatsCard(
//         title: 'Synced Employees',
//         value: '77',
//         icon: Icons.people,
//         iconColor: AppColors.dashboardBlueIcon,
//         gradient: AppColors.employeesGradient,
//       ),
//       StatsCard(
//         title: 'Inside Company',
//         value: '66',
//         icon: Icons.file_download_outlined,
//         iconColor: AppColors.dashboardGreenIcon,
//         gradient: AppColors.insideCompanyGradient,
//       ),
//       StatsCard(
//         title: 'Outside Company',
//         value: '34',
//         icon: Icons.file_upload_outlined,
//         iconColor: AppColors.dashboardRedIcon,
//         gradient: AppColors.outsideCompanyGradient,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cards = buildCards();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16),
//         itemCount: cards.length,
//         itemBuilder: (context, index) => cards[index],
//         separatorBuilder: (context, index) => const SizedBox(height: 20),
//       ),
//     );
//   }
// }
import 'package:attendance_system/l10n/app_localizations.dart';
import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
import 'package:attendance_system/widget/states_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  List<Widget> buildCards(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      StatsCard(
        title: l10n.syncedDevices,
        value: '2',
        icon: Icons.monitor,
        iconColor: AppColors.dashboardGreenIcon,
        gradient: AppColors.devicesGradient,
      ),
      StatsCard(
        title: l10n.syncedLogs,
        value: '34,802',
        icon: Icons.description,
        iconColor: AppColors.dashboardRedIcon,
        gradient: AppColors.logsGradient,
      ),
      StatsCard(
        title: l10n.syncedEmployees,
        value: '77',
        icon: Icons.people,
        iconColor: AppColors.dashboardBlueIcon,
        gradient: AppColors.employeesGradient,
      ),
      StatsCard(
        title: l10n.insideCompany,
        value: '66',
        icon: Icons.file_download_outlined,
        iconColor: AppColors.dashboardGreenIcon,
        gradient: AppColors.insideCompanyGradient,
      ),
      StatsCard(
        title: l10n.outsideCompany,
        value: '34',
        icon: Icons.file_upload_outlined,
        iconColor: AppColors.dashboardRedIcon,
        gradient: AppColors.outsideCompanyGradient,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cards = buildCards(context);
    final width = MediaQuery.sizeOf(context).width;

    // Padding يتغير حسب عرض الشاشة (مريح للصغير والكبير)
    final horizontalPadding = (width * 0.04).clamp(16.0, 32.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboard),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            16,
            horizontalPadding,
            16,
          ),
          itemCount: cards.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            // كل كارد أقصى عرض له 520px، والباقي يتقسم تلقائياً
            maxCrossAxisExtent: 520,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            // عدّلها لو حاسس الكارد طويل/قصير
            childAspectRatio: 3.3,
          ),
          itemBuilder: (context, index) => cards[index],
        ),
      ),
    );
  }
}
