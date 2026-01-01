import 'package:attendance_system/l10n/app_localizations.dart';
import 'package:attendance_system/utils/data_utils.dart/data_utails.dart';
import 'package:flutter/material.dart';

class MonthHeader extends StatelessWidget {
  final DateTime selectedDate; //التاريخ الحالي المختار

  final VoidCallback onPickDate; //دالة تُنفذ لما نضغط على أيقونة التقويم

  final VoidCallback? onExport; //دالة التصدير

  const MonthHeader({
    super.key,
    required this.selectedDate,
    required this.onPickDate,
    this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.calendar_month, color: Colors.indigo),
            onPressed: onPickDate,
          ),
          Expanded(
            child: Text(
              "${monthName(selectedDate.month)}, ${selectedDate.year}", //جاي من ملف utils
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: onExport,
            child: Text(
              l10n.export,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
