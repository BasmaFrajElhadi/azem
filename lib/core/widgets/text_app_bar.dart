import 'package:final_azem/core/constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';

class TextAppBar extends StatelessWidget {
  final String title;

  const TextAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.appBarHeightSm,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back when tapped
              },
              child: Image.asset(
                IconsPath.backArrowIcon,
                height: AppSizes.iconXxl,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.fontSizeXxl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
