import 'dart:async'; // Import the dart:async package for Timer
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../../../../core/widgets/bottom_bar.dart';


class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({Key? key}) : super(key: key);

  @override
  _WorkoutsScreenState createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  late VideoPlayerController _controller;
  Timer? _timer; // Timer to update the UI

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

  @override
  void initState() {
    super.initState();
    // Initialize video controller with a network or asset video
    _controller = VideoPlayerController.asset(
      'assets/videos/running.mp4', // Replace with your video path
    )
      ..initialize().then((_) {
        setState(() {}); // Ensure the video is displayed after initialization
      });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when done
    _controller.dispose(); // Dispose the controller when done
    super.dispose();
  }

  String formatDuration(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(position.inHours);
    final minutes = twoDigits(position.inMinutes.remainder(60));
    final seconds = twoDigits(position.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_controller.value.isPlaying) {
        setState(() {}); // Update the UI every second
      }
    });
  }

  @override
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
                BasicAppBar(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                // Video Player Container with Rounded Corners
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge, // Clips the child widget to the border radius
                  child: _controller.value.isInitialized
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Apply rounded corners
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                      : Container(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),

                // Counter showing the current position of the video
                _controller.value.isInitialized
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      // Counter Text
                      Text(
                        formatDuration(_controller.value.position),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSizes.spaceBetweenItemsMd), // Space between counter and button
                      // Play/Pause button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                              _startTimer(); // Start timer when playing
                            }
                          });
                        },
                        child: CircleAvatar(
                          radius: 30, // Size of the circle
                          backgroundColor: Theme.of(context).primaryColor, // Circle color
                          child: Icon(
                            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : Container(),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                Text(
                  "الفيديوهات التالية",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: AppSizes.spaceBetweenItemsMd),
                // Insert TimelineCards here
                ...List.generate(titles.length, (i) {
                  return TimelineCard(
                    title: titles[i],
                    text: texts[i],
                    imagePath: 'assets/images/Squats.jpg',
                    id: i,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class TimelineCard extends StatelessWidget {
  final String title;
  final String text;
  final String imagePath;
  final int id;

  const TimelineCard({
    Key? key,
    required this.title,
    required this.text,
    required this.imagePath,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white, // Set card color to white
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row to align the image and text
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded widget to allow text to take available space
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 2, // Limit the number of lines for the text to prevent overflow
                        overflow: TextOverflow.ellipsis, // Add ellipsis for overflowed text
                      ),
                      SizedBox(height: 8),
                      // Button below the text
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the WorkoutsScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WorkoutsScreen()),
                          );
                        },
                        child: Text("ابدأ التمرين",style: TextStyle(color:Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor, // Adjust button color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                // Image on the right side, wrapped in Flexible to handle overflow
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

