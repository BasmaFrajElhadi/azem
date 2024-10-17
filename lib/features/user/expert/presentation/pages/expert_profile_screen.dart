import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/colors.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import 'package:final_azem/core/constants/sizes.dart';

import '../../../../../core/constants/images_path.dart';


class ExpertProfileScreen extends StatefulWidget {
  const ExpertProfileScreen({super.key});

  @override
  _ExpertProfileScreenState createState() => _ExpertProfileScreenState();
}

class _ExpertProfileScreenState extends State<ExpertProfileScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Image at the top
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/expert/trainers/tranier6.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.md, horizontal: AppSizes.md),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Back icon (right side)
                              IconButton(
                                icon:  Image.asset(
                                IconsPath.backArrowIcon,
                                  height: AppSizes.iconXxl,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              // Share icon (left side)
                              PopupMenuButton<int>(
                                icon: Image.asset(
                                  IconsPath.menuDotsIcon,
                                  height: AppSizes.iconMd,
                                  color: AppColors.white,
                                ),
                                onSelected: (value) {
                                  if (value == 0) {
                                    print("ابلاغ clicked");
                                    // Add your reporting logic here
                                  } else if (value == 1) {
                                    print("مشاركة clicked");
                                    // Add your sharing logic here
                                  }
                                },
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Text('ابلاغ',textAlign: TextAlign.right),

                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Text('مشاركة'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'محمد علي',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 15),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'مدرب رياضي',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    isLiked
                                        ? IconsPath.filledFavoriteIcon // Liked state icon
                                        : IconsPath.favoriteIcon,    // Default icon
                                    height: AppSizes.iconLg,
                                  ),
                                  onPressed: () {
                                    // Toggle the heart icon on click
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  },
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '120 إعجاب',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'محمد علي هو مدرب رياضي ذو خبرة تزيد عن 10 سنوات في التدريب الشخصي وتطوير اللياقة البدنية. '
                              'يتميز بأسلوبه الفريد في تحفيز عملائه لتحقيق أهدافهم الشخصية سواء كانت تتعلق بفقدان الوزن، '
                              'بناء العضلات، أو تحسين اللياقة العامة. خلال مسيرته المهنية، عمل مع عدد كبير من الأفراد من جميع الفئات العمرية '
                              'والمستويات البدنية، بما في ذلك الرياضيين المحترفين. بالإضافة إلى ذلك، شارك في العديد من المؤتمرات الدولية وورش العمل '
                              'لتعزيز معرفته بأحدث تقنيات التدريب. محمد يتمتع بروح قيادية وشغف كبير بنقل خبرته إلى عملائه، ويعتمد دائماً على بناء '
                              'خطط تدريب مخصصة تتناسب مع احتياجات وأهداف كل شخص. في أوقات فراغه، يقوم بتقديم نصائح صحية عبر وسائل التواصل الاجتماعي، '
                              'حيث يتابعه آلاف الأشخاص للحصول على إرشادات متعلقة بالتغذية واللياقة البدنية.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Left Column (Text + Button)
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'حقق أهدافك الرياضية بسرعة مع برامج تدريبية مخصصة من مدرب شخصي محترف، سواء لبناء العضلات، تحسين اللياقة، أو فقدان الوزن.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        _showBottomSheet(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: Text(
                                        'اشترك الان',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(width: 16.0),
                              // Right Column (Image)
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    ImagesPath.runningManImage,
                                    fit: BoxFit.cover,
                                    height: 180,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16),
                        // comment section
                        Text(
                          'التعليقات',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: 'أضف تعليقك هنا...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: AppColors.textHint),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              // In your ElevatedButton inside the comment section
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('إرسال التعليق', style: TextStyle(color: AppColors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  textStyle: TextStyle(fontSize: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0), // Use the same radius as other buttons
                                  ),
                                ),
                              ),

                              SizedBox(height: AppSizes.spaceBetweenItemsMd),
                              Text(
                                'التعليقات السابقة',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  // Comment
                                  _buildComment('علي محمد', 'هذا مدرب رائع! أنصح الجميع بالتسجيل.', 'قبل 5 ساعات'),
                                  _buildComment('علي محمد', 'هذا مدرب رائع! أنصح الجميع بالتسجيل.', 'قبل 5 ساعات'),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String name, String comment, String time) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.spaceBetweenItemsSm),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/workoutman.jpg'),
          ),
          SizedBox(width: AppSizes.spaceBetweenItemsSm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  comment,
                  style: TextStyle(color: AppColors.textSecondary,fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.sm,),
          Column(
            children: [
              Text(
                time,
                style: TextStyle(color: AppColors.textHint),
              ),
            ],
          ),
        ],
      ),
    );
  }

// Method to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    // State variable to hold the currently selected payment method
    String? _selectedPaymentMethod = 'PayPal'; // Default selected payment method

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title at the top center
                  Text(
                    'تفاصيل الدفع',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Dropdown and price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price on the right
                      Text(
                        '200 د.ل',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      // Dropdown button on the left
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor, // Primary color background
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          value: 'المدة',
                          items: <String>['المدة', 'شهري', '3 شهور', '6 شهور'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle change
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          dropdownColor: AppColors.primaryColor, // Dropdown background color
                          iconEnabledColor: Colors.white, // Dropdown icon color (white)
                          underline: SizedBox(), // Removes the underline
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Payment methods grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 1,  // Adjusted aspect ratio for shorter height
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: 4, // Number of payment methods
                      itemBuilder: (context, index) {
                        List<String> paymentMethods = ['ادفعلي', 'موبي كاش', 'سداد', 'ادفعلي'];
                        List<String> paymentImages = [
                          'assets/icons/logos/edfelieLogo.png',    // Example image paths
                          'assets/icons/logos/mobicashLogo.png',
                          'assets/icons/logos/saddadLogo.png',
                          'assets/icons/logos/edfelieLogo.png'
                        ];

                        String method = paymentMethods[index];
                        String imagePath = paymentImages[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPaymentMethod = method; // Update the selected method
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: _selectedPaymentMethod == method
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade300, // Change border color on selection
                                width: 2.0, // Border width
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),  // Add padding to the content
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imagePath,      // Load the image from assets
                                    width: 35,      // Set image width
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 12),  // Space between image and text
                                  Text(
                                    method,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 16,
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor, // Primary color background
                        minimumSize: Size(double.infinity, 50),  // Button stretches to fill the width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),  // Rounded corners
                        ),
                      ),
                      child: Text(
                        'اشترك',  // Button text
                        style: TextStyle(
                          color: Colors.white, // White text
                          fontSize: 18,  // Font size
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }

}
