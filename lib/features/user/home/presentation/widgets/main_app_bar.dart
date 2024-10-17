import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import '../../../../../core/constants/icons_path.dart';
import '../../../notifications/presentation/pages/notifications_screen.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.appBarHeightSm,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsScreen(),
                ),
              );
            },
            child: Image.asset(
              IconsPath.notificationBellIcon,
              height: AppSizes.iconMd,
            ),
          ),
          // User image
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
