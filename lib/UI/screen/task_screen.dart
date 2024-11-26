import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/size.dart';
import '../../utils/thems.dart';
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Center(
      child: Text("Task Screen loading ...",
        style: AppTheme.getTextStyle(
            themeData.textTheme.bodyLarge!,
            color: AppColors.black,
            fontWeight: 700,
            fontSize: MySize.size30),
      ),
    );
  }
}
