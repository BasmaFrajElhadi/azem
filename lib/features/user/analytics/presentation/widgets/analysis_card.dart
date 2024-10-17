import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';

class AnalysisCard extends StatelessWidget {
  final String title;
  final String pageNavigation;
  final String imagePath;

  const AnalysisCard({
    Key? key,
    required this.title,
    required this.pageNavigation,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column( // Changed to Column to stack content vertically
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
        children: [
          // Image at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150, // Adjust image height
            ),
          ),
          // Title in the middle
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ),
          // Button at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor, // Use primary color
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, pageNavigation);
              },
              child: const Text(
                'عرض التفاصيل',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
