import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component3 extends StatelessWidget {
  const Component3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the device's dimensions
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: 10), // 1% of screen height
        // Divider
        Container(
          width: deviceWidth * 0.9, // 90% of the screen width
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            border: Border.all(
              color: const Color(0xFF2F5B6C),
              width: 2,
            ),
          ),
        ),
        SizedBox(height: 8), // 1% of screen height
        // Parent Container
        Container(
          width: deviceWidth * 0.9, // 90% of the screen width
          height: deviceHeight * 0.15, // 15% of the screen height
          decoration: const BoxDecoration(
            color: Color.fromARGB(0, 85, 166, 196),
          ),
          child: Row(
            children: [
              // First clickable SVG with blur
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event here for the first image
                    print("First image clicked");
                  },
                  child: Container(
                    child: Center(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Increased blur effect
                          child: SvgPicture.asset(
                            'assets/QuickInfo.svg',
                            width: deviceWidth * 0.14, // Adjusted size
                            height: deviceHeight * 0.14, // Adjusted size
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Add spacing between the two images
              SizedBox(width: 8), // Fixed 8px space
              // Second clickable SVG with blur
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event here for the second image
                    print("Second image clicked");
                  },
                  child: Container(
                    child: Center(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Increased blur effect
                          child: SvgPicture.asset(
                            'assets/QuickInfo.svg',
                            width: deviceWidth * 0.14, // Adjusted size
                            height: deviceHeight * 0.14, // Adjusted size
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
