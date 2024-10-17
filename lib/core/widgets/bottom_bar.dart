import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:final_azem/core/constants/colors.dart';
import '../../features/expert/users/presentation/pages/user_profile_screen.dart';
import '../../features/user/analytics/presentation/pages/analysis_screen.dart';
import '../../features/user/expert/presentation/pages/experts_screen.dart';
import '../../features/user/home/presentation/pages/home_screen.dart';
import '../../features/user/nutrition/presentation/pages/meals.dart';
import '../../features/user/wokout/presentation/pages/workout_calculator.dart';

class CustomBottomBar extends StatefulWidget {
  final Widget child;

  const CustomBottomBar({Key? key, required this.child}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ExpertScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnalysisScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()),
        );
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
          circleColors: [
            AppColors.white,
            AppColors.primaryColor,
            AppColors.secondaryColor
          ],
          iconTheme: const IconThemeData(color: AppColors.mediumGray),
          activeIconTheme: const IconThemeData(color: AppColors.primaryColor),
          backgroundColor: Colors.white,
          titleStyle: const TextStyle(color: AppColors.textPrimary, fontSize: 12),
          activeTitleStyle: const TextStyle(
              color: AppColors.primaryColor, fontSize: 12, fontWeight: FontWeight.bold),
          actionButtonDetails: SCActionButtonDetails(
            color: AppColors.primaryColor,
            icon: const Icon(Icons.add, color: AppColors.white),
            elevation: 2,
          ),
          elevation: 2.0,
          items: [
            SCBottomBarItem(
              icon: Icons.home,
              title: "الرئيسية",
              onPressed: () => _onItemTapped(0),
            ),
            SCBottomBarItem(
              icon: Icons.explore,
              title: "خبراء",
              onPressed: () => _onItemTapped(1),
            ),
            SCBottomBarItem(
              icon: Icons.show_chart,
              title: "التقدم",
              onPressed: () => _onItemTapped(2),
            ),
            SCBottomBarItem(
              icon: Icons.library_books,
              title: "برامج",
              onPressed: () => _onItemTapped(3),
            ),
          ],
          circleItems: [
            SCItem(
              icon: const Icon(Icons.print),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MealsScreen()),
                );
              },
            ),
            SCItem(
              icon: const Icon(Icons.map),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WorkoutCalculatorScreen()),
                );
              },
            ),
          ],
          bnbHeight: 80,
        ),
        child: widget.child,
      ),
    );
  }
}
