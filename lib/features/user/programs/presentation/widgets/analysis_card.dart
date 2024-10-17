import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/images_path.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/sizes.dart';

class AnalysisCar extends StatelessWidget {
  final String title;
  final String pageNavigation;
  final String imagePath;

  const AnalysisCar({
    Key? key,
    required this.title,
    required this.pageNavigation,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, pageNavigation);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Color(0xFFEDEDED)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image on the right
                  Image.asset(
                    imagePath,
                    height: 100, // Adjust height as needed
                    width: 100,  // Adjust width as needed
                    fit: BoxFit.cover, // Adjust fit to cover
                  ),
                  // Text and arrow icon on the left
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeMd,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Image.asset(IconsPath.rightGreyArrowIcon, height: 12),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
