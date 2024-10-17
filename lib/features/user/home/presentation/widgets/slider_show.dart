import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../../core/constants/images_path.dart';

class SliderShow extends StatefulWidget {
  @override
  State<SliderShow> createState() => _SliderShowState();
}

class _SliderShowState extends State<SliderShow> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        viewportFraction: 0.8,
      ),
      items: [
        _buildCardItem(
          title: 'تمارين رياضية مع المدرب محمد علي لمدة شهرين',
          subtitle: 'اليوم الأول',
          imagePath: ImagesPath.firstImageSlider,
          buttonText: 'القي نظرة',
          expertName: 'محمد أحمد',
        ),
        _buildCardItem(
          title: 'تمارين رياضية مع المدرب محمد علي لمدة شهرين',
          subtitle: 'اليوم الأول',
          imagePath: ImagesPath.secondImageSlider,
          buttonText: 'القي نظرة',
          expertName: 'علي خالد',
        ),
      ],
    );
  }

  // A method to build each card item
  Widget _buildCardItem({
    required String title,
    required String subtitle,
    required String imagePath,
    required String buttonText,
    required String expertName,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Color(0xFF9DCEFF),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.buttonRadiusMd)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Text
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.spaceBetweenItemsMd),

          // Subtitle Text in grey
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 70),

          // Bottom row with button and expert profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(imagePath),
                  ),
                  SizedBox(width: 8),
                  Text(
                    expertName,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Button on the left
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
