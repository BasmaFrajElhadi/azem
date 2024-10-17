import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/images_path.dart';
import 'package:final_azem/core/constants/sizes.dart';


class AnalysisMealsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const AnalysisMealsCard({
    Key? key,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                ],
              ),
            ],
          ),
        ),
        // Image
        Positioned(
          left: -20,
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
