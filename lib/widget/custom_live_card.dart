import 'package:attendance_system/l10n/app_localizations.dart';
import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLiveCard extends StatelessWidget {
  final String day;
  final String month;
  final String? arrival;
  final String? departure;
  final bool? isPresent;

  const CustomLiveCard({
    super.key,
    required this.day,

    required this.month,
    this.arrival,
    this.departure,
    this.isPresent,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool present = isPresent ?? false;

    final Color statusColor = present ? Colors.green : Colors.red;
    final IconData statusIcon = present
        ? Icons.arrow_upward
        : Icons.arrow_downward;
    final String statusText = present ? l10n.present : l10n.absent;

    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 📅 Date
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  month,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),

            // ⏰ Times
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  timeRow(l10n.arrival, arrival ?? '--:--'),
                  const SizedBox(height: 6),
                  timeRow(l10n.departure, departure ?? '--:--'),
                ],
              ),
            ),

            // ✅ Status
            Row(
              children: [
                Icon(statusIcon, color: statusColor),
                const SizedBox(width: 4),
                Text(
                  statusText,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget timeRow(String label, String time) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ),
        Text(time, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
