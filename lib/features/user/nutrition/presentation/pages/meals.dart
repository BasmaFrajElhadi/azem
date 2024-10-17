import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/images_path.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/text_app_bar.dart';
import '../widgets/meals_left_card.dart';
import '../widgets/meals_right_card.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color for the entire screen
      backgroundColor: AppColors.backgroundLight,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          // Container to ensure the background color is applied
          color: AppColors.backgroundLight,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
            children: [
              TextAppBar(title: 'اضافة الوجبات'),
              SizedBox(height: AppSizes.spaceBetweenItemsMd),
              MealsCardLeftSide(
                mealId:1,
                title: 'وجبة الإفطار',
                subtitle: 'نوصي بحوالي 20-25% \nمن الاحتياج اليومي',
                imagePath: ImagesPath.breakfastImage,
              ),
              SizedBox(height: AppSizes.spaceBetweenItemsMd),
              MealsCardRightSide(
                mealId:2,
                title: 'وجبة الغذاء',
                subtitle: 'نوصي بحوالي 30-35% \nمن الاحتياج اليومي',
                imagePath: ImagesPath.lunchImage,
              ),
              SizedBox(height: AppSizes.spaceBetweenItemsMd),
              MealsCardLeftSide(
                mealId:3,
                title: 'وجبة خفيفة',
                subtitle: 'نوصي بحوالي 25-30% \nمن الاحتياج اليومي',
                imagePath: ImagesPath.snakeImage,
              ),
              SizedBox(height: AppSizes.spaceBetweenItemsMd),
              MealsCardRightSide(
                mealId:4,
                title: 'وجبة العشاء',
                subtitle: 'نوصي بحوالي 10-15%\n  من الاحتياج اليومي',
                imagePath: ImagesPath.dinnerImage,
              ),
              SizedBox(height: AppSizes.spaceBetweenItemsMd),
            ],
          ),
        ),
      ),
    );
  }
}
