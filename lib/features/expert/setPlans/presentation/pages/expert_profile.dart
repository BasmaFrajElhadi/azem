import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_app_bar.dart';

class ExpertProfileScreen extends StatefulWidget {
  const ExpertProfileScreen({super.key});

  @override
  _ExpertProfileScreenState createState() => _ExpertProfileScreenState();
}

class _ExpertProfileScreenState extends State<ExpertProfileScreen> {
  bool rememberMe = false;
  bool isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
          children: [
            TextAppBar(
              title: "الملف الشخصي",
            ),
            SizedBox(height: AppSizes.spaceBetweenItemsMd),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // User Image
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.md),
                        color: AppColors.mediumLightGray,
                        child: Image.asset(
                          IconsPath.userIcon,
                          height: AppSizes.iconLg,
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBetweenItemsMd),
                    // User Name
                    Text(
                      'اسم المستخدم',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add button action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'تعديل', // Button text
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spaceBetweenItemsMd),

            // Account Box
            Container(
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.lightGray),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title of the Box
                  Text(
                    'الحساب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.sm),
                  // List of items
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // Registered Programs Item
                      ListTile(
                        leading: Icon(Icons.list, color: AppColors.primaryColor),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الأشخاص المشتركين',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey), // Changed to grey
                          ],
                        ),
                        onTap: () {
                          // Handle tap
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.spaceBetweenItemsMd),

            // Notification Toggle
            Container(
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.lightGray),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications, // Change this to your desired icon
                        color: AppColors.primaryColor, // Set the icon color
                      ),
                      SizedBox(width: AppSizes.sm), // Add some space between the icon and text
                      Text(
                        'تفعيل الإشعارات',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: isNotificationEnabled,
                    activeColor: AppColors.primaryColor, // Set the color when active
                    inactiveTrackColor: AppColors.lightGray, // Set the color when inactive
                    onChanged: (bool value) {
                      setState(() {
                        isNotificationEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSizes.spaceBetweenItemsMd),
            //  Box: تواصل معنا, سجل الخروج,
            Container(
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.lightGray),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title of the New Box
                  Text(
                    'اخرى',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.sm),
                  // Contact Us Item
                  ListTile(
                    leading: Icon(Icons.phone, color: AppColors.primaryColor),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تواصل معنا',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey), // Changed to grey
                      ],
                    ),
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  // Log Out Item
                  ListTile(
                    leading: Icon(Icons.logout, color: AppColors.primaryColor),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'سجل الخروج',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey), // Changed to grey
                      ],
                    ),
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
