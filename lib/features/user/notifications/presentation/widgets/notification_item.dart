import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/sizes.dart';

class NotificationItem extends StatelessWidget {
  final String text;

  const NotificationItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentPeach,
              ),
              child: Image.asset(
                IconsPath.notificationIcon,
                height: AppSizes.iconLg,
              ),
            ),
            SizedBox(width: AppSizes.sm),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.sm),
        Divider(
          color: AppColors.mediumGray,
          thickness: 1,
        ),
      ],
    );
  }
}
