import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';

import '../pages/calories_calculator.dart';

class MealsCardRightSide extends StatelessWidget {
  final int mealId;
  final String title;
  final String subtitle;
  final String imagePath;

  const MealsCardRightSide({
    Key? key,
    required this.mealId,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Color(0xFFEDEDED)),
          ),
          child: Row(
            children: [
              Expanded(child: Column()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeXl,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSizes.sm),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.fontSizeMd,
                    ),
                  ),
                  SizedBox(height: AppSizes.sm),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CaloriesCalculatorScreen(mealId: mealId),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'إضافة',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppSizes.fontSizeMd,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
        Positioned(
          right: -20,
          top: 0,
          child: Image.asset(
            imagePath,
            height: 150,
            width: 150,
          ),
        ),
      ],
    );
  }
}
