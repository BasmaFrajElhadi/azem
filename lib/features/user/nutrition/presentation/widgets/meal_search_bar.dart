import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/icons_path.dart';

class MealSearchBar extends StatelessWidget {
  const MealSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.buttonRadiusLg),
        border: Border.all(color: Color(0xFFEDEDED), width: 2),
      ),
      child: Row(
        children: [
          // Search icon
          Image.asset(
            IconsPath.searchIcon,
            height: AppSizes.iconSm,
          ),
          SizedBox(width: AppSizes.md),
          // TextField for search input
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن الوجبات...',
                hintStyle: TextStyle(color: Colors.grey), // Style for hint text
                border: InputBorder.none, // No border for TextField
              ),
            ),
          ),
          // Barcode icon
          SizedBox(width: AppSizes.md),
          Image.asset(
            IconsPath.barcodeBtnIcon,
            height: AppSizes.iconXl,
          ),
        ],
      ),
    );
  }
}
