import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/size.dart';
import '../../utils/thems.dart';

class CustomIconTextCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomIconTextCard({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color:  AppColors.darkGrey,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size10 ?? 0)),
          border: Border.all(color: AppColors.containerBoarder, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MySize.size16 ?? 0,
            horizontal: MySize.size16 ?? 0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: MySize.size24,
                  width: MySize.size22,
                  child: Image.asset(imagePath, fit: BoxFit.contain)),
              SizedBox(height: MySize.size5),
              Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyLarge!,
                  color: AppColors.lightBlack,
                  fontWeight: 400,
                  fontSize: MySize.size14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
