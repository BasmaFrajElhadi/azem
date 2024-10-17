import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';

class CaloriesBurned extends StatefulWidget {
  const CaloriesBurned({super.key});

  @override
  State<CaloriesBurned> createState() => _CaloriesBurnedState();
}

class _CaloriesBurnedState extends State<CaloriesBurned> {
  // Method to build info columns with title and value
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  // Method to build a light grey divider
  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 20.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.md),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Radial Gauge in the background
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: SfRadialGauge(
                  axes: [
                    RadialAxis(
                      startAngle: 180,
                      endAngle: 0,
                      showLabels: false,
                      showTicks: false,
                      axisLineStyle: AxisLineStyle(
                        thickness: 20,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Colors.grey[300],
                      ),
                      pointers: [
                        RangePointer(
                          value: 70,
                          cornerStyle: CornerStyle.bothCurve,
                          color: AppColors.primaryColor,
                          width: 20,
                        ),
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'اجمالي السعرات المحروقة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: AppSizes.sm),
                              Text(
                                '2,200',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          positionFactor: 0.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Row of information on top of the empty part (bottom half)
            Positioned(
              bottom: 0, // Align to the bottom of the Stack
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IBM Text and Value
                    _buildInfoColumn("IBM", "18.5"),
                    _buildDivider(),
                    // Exercise Duration
                    _buildInfoColumn("مدة التمرين", "2 ساعة"),
                    _buildDivider(),
                    // Calories Burned
                    _buildInfoColumn("الحرق", "2,000"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
