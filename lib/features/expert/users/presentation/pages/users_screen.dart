import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/widgets/basic_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import '../../../../../core/widgets/bottom_bar.dart';
import '../widgets/user_grid_view.dart';
import '../widgets/user_search_bar.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> allExperts = [
    {
      'imageUrl': 'assets/images/expert/trainers/tranier2.jpg',
      'title': 'محمد علي',
      'subtitle': 'مشترك لمدة شهر',
    },
    {
      'imageUrl': 'assets/images/expert/trainers/tranier6.jpg',
      'title': 'محمد علي',
      'subtitle': 'مشترك لمدة 3 شهور',
    },
  ];

  final List<Map<String, dynamic>> trainers = [
    {
      'imageUrl': 'assets/images/expert/trainers/tranier4.jpg',
      'title': 'محمد علي',
      'subtitle': 'مشترك لمدة شهر',
    },
    // ...other trainers
  ];

  final List<Map<String, dynamic>> specialists = [
    {
      'imageUrl': 'assets/images/expert/trainers/tranier6.jpg',
      'title': 'محمد علي',
      'subtitle': 'مشترك لمدة شهر',
    },
  ];
  late TabController _tabController; // Declare the TabController

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Initialize it here
    _tabController.addListener(() {
      setState(() {}); // Ensure UI updates when the tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomBar(
      child: DefaultTabController(
        length: 2,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: AppColors.backgroundLight,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundLight,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(190.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.sm,
                        horizontal: AppSizes.md,
                      ),
                      child: Column(
                        children: [
                          BasicAppBar(),
                          SizedBox(height: AppSizes.spaceBetweenItemsSm),
                          Text(
                            'بخبرتك، يمكنك إحداث فرق كبير في حياة المستخدمين وتحقيق أهدافهم نحو نمط حياة صحي ومتوازن.',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            ),
                            softWrap: true,
                          ),
                          SizedBox(height: AppSizes.spaceBetweenItemsSm),
                          UserSearchBar(),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBetweenItemsSm),

                    // Tab bar integrated directly here
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      color: AppColors.backgroundLight,
                      child: TabBar(
                        controller: _tabController, // Use the initialized controller
                        isScrollable: true,
                        unselectedLabelColor: AppColors.textPrimary,
                        labelColor: AppColors.white,
                        labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        indicator: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        tabs: List.generate(2, (index) {
                          return Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSizes.sm,
                                horizontal: AppSizes.lg,
                              ),
                              decoration: BoxDecoration(
                                color: _tabController.index == index
                                    ? AppColors.primaryColor
                                    : AppColors.mediumLightGray,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _getTabTitle(index),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _tabController, // Use the same TabController here
                    children: [
                      UserGridView(expertList: allExperts),
                      UserGridView(expertList: trainers),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getTabTitle(int index) {
    switch (index) {
      case 0:
        return 'الكل';
      case 1:
        return 'المشتركيين الجدد';
      default:
        return '';
    }
  }
}
