import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/bottom_bar.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/slider_show.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomBottomBar(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.xl, horizontal: AppSizes.md),
            child: ListView(
              children: [
                MainAppBar(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                HomeSearchBar(),
                SizedBox(height: AppSizes.spaceBetweenItemsLg),
                Text("برامجك الحالية",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                SizedBox(height: AppSizes.spaceBetweenItemsSm),
                SliderShow(),
                // SizedBox(height: AppSizes.spaceBetweenItemsMd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
