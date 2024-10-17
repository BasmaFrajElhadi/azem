import 'package:flutter/material.dart';
import 'package:final_azem/core/constants/icons_path.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../pages/user_profile_screen.dart';

class UserCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;


  const UserCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late bool isLiked;
  late int currentLoves;

  @override
  void initState() {
    super.initState();
    isLiked = false; // Initialize as not liked

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ExpertProfileScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfileScreen(
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

class UserGridView extends StatelessWidget {
  final List<Map<String, dynamic>> expertList;

  const UserGridView({super.key, required this.expertList});

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
          return UserCard(
            imageUrl: expertList[index]['imageUrl'],
            title: expertList[index]['title'],
            subtitle: expertList[index]['subtitle'],
          );
        },
      ),
    );
  }
}
