import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/size.dart';
import '../../utils/thems.dart';
class CustomAppBars extends StatelessWidget {
  const CustomAppBars({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top:MySize.size10??0,left: MySize.size10??0,right: MySize.size10??0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey,
              ),
              child: Padding(
                padding: EdgeInsets.all(MySize.size8??0),
                child: Image.asset("assets/notification.png"),
              )),
          Text("DH",
            style: AppTheme.getTextStyle(
                themeData.textTheme.bodyLarge!,
                color: AppColors.black,
                fontWeight: 700,
                fontSize: MySize.size30),
          ),
          Container(
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey,
              ),
              child: Padding(
                padding: EdgeInsets.all(MySize.size8??0),
                child: Image.asset("assets/cart.png"),
              )),
        ],
      ),
    );
  }
}
