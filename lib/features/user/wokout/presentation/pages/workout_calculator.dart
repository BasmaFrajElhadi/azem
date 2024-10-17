import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/widgets/basic_app_bar.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import '../widgets/workout_card.dart';
import '../widgets/workout_search_bar.dart';
import '../widgets/workout_slider.dart';

class WorkoutCalculatorScreen extends StatefulWidget {
  const WorkoutCalculatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WorkoutCalculatorScreenState createState() => _WorkoutCalculatorScreenState();
}

class _WorkoutCalculatorScreenState extends State<WorkoutCalculatorScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<List<Map<String, String>>> workoutData = [
    [
      {'image': 'assets/images/JumpRope.png', 'text': 'الجري'},
      {'image': 'assets/images/cycling.png', 'text': 'ركوب الدراجة'},
    ],
    [
      {'image': 'assets/images/JumpRope.png', 'text': 'رفع الأثقال'},
      {'image': 'assets/images/cycling.png', 'text': 'تمارين الضغط'},
    ],
    [
      {'image': 'assets/images/JumpRope.png', 'text': 'اليوغا'},
      {'image': 'assets/images/cycling.png', 'text': 'تمارين التمدد'},
    ],
    [
      {'image': 'assets/images/JumpRope.png', 'text': 'تمارين بيربي'},
      {'image': 'assets/images/cycling.png', 'text': 'القفز القرفصائي'},
    ],
    [
      {'image': 'assets/images/JumpRope.png', 'text': 'تحية الشمس'},
      {'image': 'assets/images/cycling.png', 'text': 'وضعية الشجرة'},
    ],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Triggers rebuild when the tab is changed
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the TabController when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundLight,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(140.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.sm, horizontal: AppSizes.md),
                  child: Column(
                    children: [
                      BasicAppBar(),
                      SizedBox(height: AppSizes.spaceBetweenItemsMd),
                      WorkoutSearchBar(),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.sm),
                Container(
                  color: AppColors.backgroundLight,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    unselectedLabelColor: AppColors.textPrimary,
                    labelColor: AppColors.white,
                    labelPadding: EdgeInsets.symmetric(horizontal: 8),
                    indicator: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    tabs: List.generate(5, (index) {
                      return Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: AppSizes.sm, horizontal: AppSizes.lg),
                          decoration: BoxDecoration(
                            color: _tabController.index == index
                                ? AppColors.primaryColor
                                : AppColors.mediumLightGray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(_getTabTitle(index)),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    WorkoutSlider(workouts: workoutData[0]), // Tab 1
                    WorkoutSlider(workouts: workoutData[1]), // Tab 2
                    WorkoutSlider(workouts: workoutData[2]), // Tab 3
                    WorkoutSlider(workouts: workoutData[3]), // Tab 4
                    WorkoutSlider(workouts: workoutData[4]), // Tab 5
                  ],
                ),
              ),

              // Static content at the bottom
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
                child: Column(
                  children: [
                    // burned calories
                    Text(
                      '500',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    Text(
                      'سعرة حرارية محروقة',
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
                    ),
                    SizedBox(height: AppSizes.spaceBetweenItemsMd),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsPath.addIcon, height: AppSizes.iconXl),
                        SizedBox(width: AppSizes.spaceBetweenItemsXl),
                        Text(
                          '5',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.xl,
                          ),
                        ),
                        SizedBox(width: AppSizes.spaceBetweenItemsXl),
                        Image.asset(IconsPath.minusIcon, height: AppSizes.iconXl),
                      ],
                    ),
                    SizedBox(height: AppSizes.spaceBetweenItemsMd),
                    WorkoutCard(
                      title: 'تمارين الضغط',
                      subtitle: '100 سعرة حرارية',
                      imagePath: 'assets/images/JumpRope.png',
                    ),
                    SizedBox(height: AppSizes.spaceBetweenItemsLg),
                    WorkoutCard(
                      title: 'تمارين القفز',
                      subtitle: '150 سعرة حرارية',
                      imagePath: 'assets/images/JumpRope.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTabTitle(int index) {
    switch (index) {
      case 0:
        return 'تمارين القلب';
      case 1:
        return 'القوة';
      case 2:
        return 'المرونة';
      case 3:
        return 'HIIT';
      case 4:
        return 'اليوغا';
      default:
        return '';
    }
  }
}
