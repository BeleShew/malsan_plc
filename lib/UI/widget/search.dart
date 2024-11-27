import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/size.dart';
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(MySize.size12??0,),
          borderSide:const BorderSide(
            color: AppColors.boarder,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MySize.size12??0),
          borderSide:const BorderSide(
            color: AppColors.boarder,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(MySize.size12??0),
          borderSide:const BorderSide(
            color: AppColors.boarder,
            width: 1,
          ),
        ),
        hintText: 'Search',
        fillColor: AppColors.white,
          suffixIcon: Image.asset("assets/search.png",),
      ),
    );
  }
}
