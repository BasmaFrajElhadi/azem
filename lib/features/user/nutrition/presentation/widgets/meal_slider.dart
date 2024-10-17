import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MealsSlider extends StatefulWidget {
  final List<Map<String, String>> meals;

  const MealsSlider({Key? key, required this.meals}) : super(key: key);

  @override
  _MealsSliderState createState() => _MealsSliderState();
}

class _MealsSliderState extends State<MealsSlider> {
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
          items: widget.meals.map((meal) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      meal['image'] ?? 'assets/images/fallback.png',
                      height: 200.0, // Adjust image size
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
