import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:final_azem/core/widgets/basic_app_bar.dart';
import '../../../../../core/constants/icons_path.dart';
import '../../../../../core/constants/images_path.dart';
import '../widgets/calories_card.dart';
import '../widgets/meal_search_bar.dart';
import '../widgets/meal_slider.dart';

class CaloriesCalculatorScreen extends StatefulWidget {
  final int mealId;

  const CaloriesCalculatorScreen({
    Key? key,
    required this.mealId,
  }) : super(key: key);

  @override
  _CaloriesCalculatorScreenState createState() => _CaloriesCalculatorScreenState();
}

class _CaloriesCalculatorScreenState extends State<CaloriesCalculatorScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<List<Map<String, String>>> mealData = [
    // Data for each tab
    [
      {'image': 'assets/images/soup.png', 'text': 'شوربة عدس'},
      {'image': 'assets/images/soup2.png', 'text': 'شوربة خضار'},
    ],
    [
      {'image': 'assets/images/soup.png', 'text': 'دجاج مشوي'},
      {'image': 'assets/images/soup.png', 'text': 'لحم مشوي'},
    ],
    [
      {'image': 'assets/images/soup.png', 'text': 'تفاح'},
      {'image': 'assets/images/soup.png', 'text': 'موز'},
    ],
    [
      {'image': 'assets/images/soup.png', 'text': 'كعكة الشوكولاتة'},
      {'image': 'assets/images/soup.png', 'text': 'بسبوسة'},
    ],
    [
      {'image': 'assets/images/soup.png', 'text': 'عصير برتقال'},
      {'image': 'assets/images/soup.png', 'text': 'عصير تفاح'},
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
                      MealSearchBar(),
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
                    MealsSlider(meals: mealData[0]), // Tab 1
                    MealsSlider(meals: mealData[1]), // Tab 2
                    MealsSlider(meals: mealData[2]), // Tab 3
                    MealsSlider(meals: mealData[3]), // Tab 4
                    MealsSlider(meals: mealData[4]), // Tab 5
                  ],
                ),
              ),

// ===================================
                // Static content at the bottom
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
                  child: Column(
                    children: [
                      // total calories
                      Text(
                        '200',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'سعرة حرارية',
                        style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
                      ),
                      SizedBox(height: AppSizes.spaceBetweenItemsMd),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsPath.addIcon, height: AppSizes.iconXl),
                          SizedBox(width: AppSizes.spaceBetweenItemsXl),
                          Text(
                            '1',
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
                      CaloriesCard(
                        title: 'بيض',
                        subtitle: '200 سعرة حرارية\n 20 دهون \n 3 صوديوم',
                        imagePath: ImagesPath.snakeImage,
                      ),
                      SizedBox(height: AppSizes.spaceBetweenItemsMd),
                      CaloriesCard(
                        title: 'بيض',
                        subtitle: '200 سعرة حرارية\n 20 دهون \n 3 صوديوم',
                        imagePath: ImagesPath.snakeImage,
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
        return 'لحوم';
      case 1:
        return 'فواكة';
      case 2:
        return 'خضروات';
      case 3:
        return 'مشروبات';
      case 4:
        return 'حلويات';
      default:
        return '';
    }
  }

}
