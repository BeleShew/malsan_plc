import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/size.dart';
import '../../utils/thems.dart';
class InputFormFields extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isDropdown;
  final bool isDatePicker;
  final bool isTimePicker;

  const InputFormFields({
    super.key,
    required this.label,
    required this.placeholder,
    this.isDropdown = false,
    this.isDatePicker = false,
    this.isTimePicker = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTheme.getTextStyle(
              color: AppColors.black,
              themeData.textTheme.bodyLarge!,
              fontWeight: 500,
              fontSize: MySize.size16,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              if (isDatePicker) {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              } else if (isTimePicker) {
                await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              }
            },
            child: TextField(
              enabled: !(isDropdown || isDatePicker || isTimePicker),
              decoration: InputDecoration(
                hintText: placeholder,
                suffixIcon: isDropdown
                    ? const Icon(Icons.arrow_drop_down,color: AppColors.mediumGrey,)
                    : isDatePicker
                    ? const Icon(Icons.calendar_today,color: AppColors.mediumGrey,)
                    : isTimePicker
                    ? const Icon(Icons.access_time,color: AppColors.mediumGrey,)
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size12??0,),
                  borderSide:const BorderSide(color: AppColors.boarder, width: 1,),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size12??0),
                  borderSide:const BorderSide(color: AppColors.boarder, width: 1,),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(MySize.size12??0),
                  borderSide:const BorderSide(color: AppColors.boarder, width: 1,),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}