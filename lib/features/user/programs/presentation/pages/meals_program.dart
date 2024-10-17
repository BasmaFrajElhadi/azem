import 'package:final_azem/core/constants/images_path.dart';
import 'package:final_azem/core/widgets/basic_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' as intl;

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/widgets/bottom_bar.dart';
import '../widgets/program_tab_bar.dart';

class MealProgramScreen extends StatelessWidget {
  const MealProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lists of titles and texts for the timeline cards
    final List<String> titles = [
      'عنوان الوجبة 1',
      'عنوان الوجبة 2',
      'عنوان الوجبة 3',
      'عنوان الوجبة 4',
    ];

    final List<String> texts = [
      'هذه هي تفاصيل الوجبة رقم 1. هنا يمكنك إضافة المزيد من المعلومات حول الوجبة.',
      'هذه هي تفاصيل الوجبة رقم 2. هنا يمكنك إضافة المزيد من المعلومات حول الوجبة.',
      'هذه هي تفاصيل الوجبة رقم 3. هنا يمكنك إضافة المزيد من المعلومات حول الوجبة.',
      'هذه هي تفاصيل الوجبة رقم 4. هنا يمكنك إضافة المزيد من المعلومات حول الوجبة.',
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomBottomBar(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
            child: ListView(
              children: [
                BasicAppBar(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                ProgramTabBar(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "10 اكتوبر 2024",
                      style: TextStyle(fontSize: 20, color: AppColors.mediumGray),
                    ),
                    SizedBox(height: AppSizes.spaceBetweenItemsSm),
                    Text(
                      "اليوم الأول",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBetweenItemsSm),
                // Timeline Cards with Indicators
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: List.generate(titles.length, (i) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Timeline Column
                          Expanded(
                            child: TimelineIndicator(
                              index: i,
                            ),
                          ),
                          // Card Column
                          Expanded(
                            flex: 5,
                            child: TimelineCard(
                              title: titles[i],
                              text: texts[i],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimelineIndicator extends StatefulWidget {
  final int index;

  const TimelineIndicator({Key? key, required this.index}) : super(key: key);

  @override
  _TimelineIndicatorState createState() => _TimelineIndicatorState();
}

class _TimelineIndicatorState extends State<TimelineIndicator> {
  Color indicatorColor = AppColors.mediumGray;
  Color lineColor = AppColors.mediumGray;
  bool isChecked = false;

  void _onIndicatorTap() {
    setState(() {
      if (indicatorColor == AppColors.primaryColor) {
        indicatorColor = AppColors.mediumGray;
        lineColor = AppColors.mediumGray;
        isChecked = false;
      } else {
        indicatorColor = AppColors.primaryColor;
        lineColor = AppColors.primaryColor;
        isChecked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onIndicatorTap,
      child: Column(
        children: [
          // Circle Indicator
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indicatorColor,
            ),
            child: Center(
              child: isChecked
                  ? Icon(Icons.check, color: Colors.white, size: 20)
                  : null,
            ),
          ),
          // Line
          Container(
            width: 4, // Width of the line
            height: widget.index == 3 ? 0 : 120, // Height of the line
            color: lineColor,
          ),
        ],
      ),
    );
  }
}

class TimelineCard extends StatelessWidget {
  final String title;
  final String text;

  const TimelineCard({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(text, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
