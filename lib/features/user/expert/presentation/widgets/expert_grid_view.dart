import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../pages/expert_profile_screen.dart';

class ExpertCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int loves;

  const ExpertCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.loves,
  });

  @override
  _ExpertCardState createState() => _ExpertCardState();
}

class _ExpertCardState extends State<ExpertCard> {
  late bool isLiked;
  late int currentLoves;

  @override
  void initState() {
    super.initState();
    isLiked = false; // Initialize as not liked
    currentLoves = widget.loves; // Start with the initial number of loves
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle like state
      currentLoves += isLiked ? 1 : -1; // Update the love count accordingly
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ExpertProfileScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpertProfileScreen(
              // name: title,
              // description: subtitle,
              // imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 180, // Width for the card
        height: 280, // Height for the card
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: AppSizes.fontSizeLg,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.subtitle,
                                style: TextStyle(
                                  fontSize: AppSizes.fontSizeMd,
                                  color: AppColors.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Love icon and number
                        GestureDetector(
                          onTap: toggleLike, // Toggle like on tap
                          child: Column(
                            children: [
                              // Change heart icon based on like status
                              Image.asset(
                                isLiked
                                    ? IconsPath.filledFavoriteIcon
                                    : IconsPath.favoriteIcon,
                                height: AppSizes.iconMd,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                currentLoves.toString(),
                                style: TextStyle(
                                  fontSize: AppSizes.fontSizeSm,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textHint,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}

class ExpertGridView extends StatelessWidget {
  final List<Map<String, dynamic>> expertList;

  const ExpertGridView({super.key, required this.expertList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two cards per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65, // Adjust for card height and width
        ),
        itemCount: expertList.length,
        itemBuilder: (context, index) {
          return ExpertCard(
            imageUrl: expertList[index]['imageUrl'],
            title: expertList[index]['title'],
            subtitle: expertList[index]['subtitle'],
            loves: expertList[index]['loves'],
          );
        },
      ),
    );
  }
}
