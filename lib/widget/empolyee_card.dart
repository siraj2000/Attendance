import 'package:attendance_system/models/users_models.dart';
import 'package:attendance_system/screens/empolyee_profile_screen.dart';
import 'package:attendance_system/widget/text_custom.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.usersMap});

  final UserModel usersMap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            //barrierDismissible: true,
            builder: (_) => EmployeeProfileDialog(user: usersMap),
          );
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              radius: 17,
              child: Text(usersMap.id.toString()),
            ),
            title: CustomText(
              text: "${usersMap.firstName} ${usersMap.lastName}",
            ),

            subtitle: CustomText(
              text: usersMap.email,
              size: 13,
              color: Colors.grey[500],
            ),
            trailing: CustomText(text: usersMap.age.toString()),
          ),
        ),
      ),
    );
  }
}
