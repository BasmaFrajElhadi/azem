import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import '../../../../core/constants/icons_path.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.appBarHeightSm,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Navigate back when tapped
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              IconsPath.backArrowIcon,
              height: AppSizes.iconXxl,
            ),
          ),
          ClipOval(
            child: Container(
              padding: EdgeInsets.all(AppSizes.md),
              color: AppColors.mediumLightGray,
              child: Image.asset(
                IconsPath.userIcon,
                height: AppSizes.iconMd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
