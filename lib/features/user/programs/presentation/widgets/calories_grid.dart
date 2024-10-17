import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';

class NutritionalCard extends StatelessWidget {
  final String title;
  final String percentage;
  final int color;

  const NutritionalCard({
    Key? key,
    required this.title,
    required this.percentage,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.sm),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Color(0xFFEDEDED)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(color),
                ),
              ),
              SizedBox(width: AppSizes.sm),
              Text(
                title,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                ),
              ),
            ],
          ),
          // Percentage on the left
          Text(
            percentage,
            style: TextStyle(
              fontSize: AppSizes.fontSizeLg,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CaloriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      shrinkWrap: true, // Ensure the GridView shrinks to the content's size
      physics: NeverScrollableScrollPhysics(), // Disable scrolling if needed
      children: [
        NutritionalCard(title: 'بروتين', percentage: '40%', color: 0xFF6BBDFF), // Protein
        NutritionalCard(title: 'دهون', percentage: '30%', color: 0xFFFFB744), // Fat
        NutritionalCard(title: 'كربوهيدرات', percentage: '20%', color: 0xFFFF76EA), // Carbohydrate
        NutritionalCard(title: 'أخرى', percentage: '10%', color: 0xFF7A6AFC), // Other
      ],
    );
  }
}
