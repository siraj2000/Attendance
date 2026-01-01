import 'package:attendance_system/l10n/app_localizations.dart';
import 'package:attendance_system/models/users_models.dart';
import 'package:attendance_system/utils/data_utils.dart/app_colors.dart';
import 'package:attendance_system/widget/text_custom.dart';
import 'package:flutter/material.dart';

class EmployeeProfileDialog extends StatelessWidget {
  final UserModel user;

  const EmployeeProfileDialog({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 240,
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(user.image),
                  ),
                  const SizedBox(height: 12),
                  CustomText(
                    text: "${user.firstName}  ${user.lastName},",
                    size: 20,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 8),
                  CustomText(text: user.phone, color: Colors.white),
                  const SizedBox(height: 8),
                  CustomText(text: user.email, color: Colors.white),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: CustomText(text: l10n.age),
                    trailing: CustomText(text: user.age.toString()),
                  ),
                  ListTile(
                    dense: true,
                    title: CustomText(text: l10n.phone),
                    trailing: CustomText(text: user.phone.toString()),
                  ),
                  ListTile(
                    dense: true,
                    title: CustomText(text: l10n.gender),
                    trailing: CustomText(text: user.gender.toString()),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(l10n.close),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
