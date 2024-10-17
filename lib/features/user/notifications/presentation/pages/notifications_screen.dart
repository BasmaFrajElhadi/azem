import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/strings/info.dart';
import '../../../../../core/widgets/text_app_bar.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    bool isThereNotification = true;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
          children: [
            TextAppBar(title: 'الإشعارات'),
            SizedBox(height: AppSizes.spaceBetweenItemsMd),

            // Conditional rendering based on isThereNotification
            if (isThereNotification) ...[
              NotificationItem(text: 'لا تفوت الفرصة! استمتع بخصم 20% على استشارات التغذية وخطط التدريب لهذا الإسبوع. \n احجز الان و استفد من العرض المميز!'),
              NotificationItem(text: 'لا تفوت الفرصة! استمتع بخصم 20% على استشارات التغذية وخطط التدريب لهذا الإسبوع. \n احجز الان و استفد من العرض المميز!'),
              NotificationItem(text: 'لا تفوت الفرصة! استمتع بخصم 20% على استشارات التغذية وخطط التدريب لهذا الإسبوع. \n احجز الان و استفد من العرض المميز!'),
              NotificationItem(text: 'لا تفوت الفرصة! استمتع بخصم 20% على استشارات التغذية وخطط التدريب لهذا الإسبوع. \n احجز الان و استفد من العرض المميز!'),
            ] else ...[
              // No notifications container
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsPath.noNotificationIcon, height: AppSizes.iconXxl),
                    SizedBox(height: AppSizes.md),
                    Text(
                      AppInfo.messageNoNotifications,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: AppSizes.fontSizeXxl,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
