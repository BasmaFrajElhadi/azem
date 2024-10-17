import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:final_azem/core/constants/icons_path.dart';

import '../pages/expert_profile_screen.dart'; // Import the new page

class ExpertCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final int likes;
  final VoidCallback onLikePressed;

  const ExpertCard({
    Key? key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.onLikePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ExpertProfileScreen and pass the necessary data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpertProfileScreen(
              // name: name,
              // description: description,
              // imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        color: AppColors.white,
        margin: EdgeInsets.symmetric(vertical: AppSizes.sm),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: AppSizes.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Image.asset(IconsPath.heartIcon, height: 20),
                      onPressed: onLikePressed,
                    ),
                    Text(
                      '$likes',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.mediumDarkGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
