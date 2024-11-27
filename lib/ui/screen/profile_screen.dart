import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/size.dart';
import '../../utils/thems.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Center(
      child: Text("Profile Screen loading ...",
        style: AppTheme.getTextStyle(
            themeData.textTheme.bodyLarge!,
            color: AppColors.black,
            fontWeight: 500,
            fontSize: MySize.size20),
      ),
    );
  }
}
