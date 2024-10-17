import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/images_path.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import '../../../../../core/widgets/bottom_bar.dart';
import '../../../../../core/widgets/text_app_bar.dart';
import '../../../expert/presentation/pages/experts_screen.dart';
import '../../../nutrition/presentation/pages/meals.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../widgets/analysis_card.dart';
import '../widgets/analysis_tabs.dart';
import '../widgets/calories_burned.dart';
import '../widgets/calories_grid.dart';
import '../widgets/total_calories.dart';
import 'analysis_meals_screen.dart';
import 'analysis_workout_screen.dart';


class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

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
                TextAppBar(title: 'أداءك'),
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










