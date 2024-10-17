import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/images_path.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/bottom_bar.dart';
import '../../../../../core/widgets/text_app_bar.dart';
import '../../../../user/analytics/presentation/pages/analysis_meals_screen.dart';
import '../../../../user/analytics/presentation/pages/analysis_workout_screen.dart';
import '../../../../user/analytics/presentation/widgets/analysis_card.dart';
import '../../../../user/analytics/presentation/widgets/analysis_tabs.dart';
import '../../../../user/analytics/presentation/widgets/calories_burned.dart';
import '../../../../user/analytics/presentation/widgets/calories_grid.dart';
import '../../../../user/analytics/presentation/widgets/total_calories.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomBottomBar(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
            child: ListView(
              children: [
                TextAppBar(title: 'اداء المشترك'),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.lightGray),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'محمد علي',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Height Box
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGray),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الطول',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(height: AppSizes.sm),
                            Text(
                              '170 سم', // Replace with dynamic data
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBetweenItemsMd),

                    // Weight Box
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGray),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الوزن',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(height: AppSizes.sm),
                            Text(
                              '70 كغ', // Replace with dynamic data
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.spaceBetweenItemsMd),

                    // Age Box
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGray),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'العمر',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(height: AppSizes.sm),
                            Text(
                              '25 سنة', // Replace with dynamic data
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.lightGray),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'مشاكل صحية',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: AppSizes.sm),
                        Text(
                          ' الم بالظهر',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                AnalysisTabBar(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                CaloriesBurned(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                TotalCalories(),
                SizedBox(height: AppSizes.spaceBetweenItemsSm),
                SizedBox(
                  height: 170,
                  child: CaloriesGrid(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AnalysisWorkoutScreen()),
                          );
                        },
                        child: AnalysisCard(
                          pageNavigation: 'fwe',
                          title: "التمارين التي قمت بها",
                          imagePath: ImagesPath.analysisImageTwo,
                        ),
                      ),
                    ),

                    SizedBox(width: AppSizes.spaceBetweenItemsSm), // Add some space between the two cards
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AnalysisMealsScreen()),
                          );
                        },
                        child: AnalysisCard(
                          pageNavigation: 'fwe',
                          title: "الوجبات التي تناولتها",
                          imagePath: ImagesPath.analysisImageOne,
                        ),
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}










