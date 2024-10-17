import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WorkoutSlider extends StatefulWidget {
  final List<Map<String, String>> workouts;

  const WorkoutSlider({Key? key, required this.workouts}) : super(key: key);

  @override
  _WorkoutSliderState createState() => _WorkoutSliderState();
}

class _WorkoutSliderState extends State<WorkoutSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            enlargeCenterPage: true,
            viewportFraction: 0.6,
          ),
          items: widget.workouts.map((meal) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      meal['image'] ?? 'assets/images/fallback.png',
                      height: 150.0, // Adjust image size
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      meal['text'] ?? 'عنصر غير معروف',
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
