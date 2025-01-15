import 'package:d1mm4/components/MyPlan.dart';
import 'package:d1mm4/components/D1CM6.dart';
import 'package:d1mm4/components/Step_4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d1mm4/controllers/card_controller.dart';
import 'package:d1mm4/components/app_bar_1.dart';
import 'package:d1mm4/components/custom_bottom_navigation_bar.dart';
import 'package:d1mm4/components/welcomebox.dart';
import 'package:d1mm4/components/accessiblitybox.dart';
import 'package:d1mm4/components/quickinfo.dart';
import 'package:d1mm4/components/horizontalinforbox.dart';
import 'components/Buisness_Account.dart';
import 'components/Progress_Lost.dart';
import 'components/Step5.dart';
import 'components/Verification.dart';
import 'controllers/btm_navigation_bar_controller.dart';
import 'components/hamburger.dart'; // Import Hamburger widget

void main() {
  // Initialize GetX controllers globally
  Get.put(BottomNavigationController()); // Initialize NavigationController
  Get.put(CardController()); // Initialize CardController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D1MM4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // Define routes
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/business-account', page: () => const BusinessAccount()),
        GetPage(name: '/verification', page: () => const Verification()),
        GetPage(name: '/step4', page: () => const Step4()),
        GetPage(name: '/step5', page: () => const Step5()),
        GetPage(name: '/myplan', page: () => const Myplan()),
        GetPage(name: '/d1cm6', page: () => const D1CM6()),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHamburgerVisible = false; // State for hamburger menu visibility

  // Toggle the visibility of the hamburger menu
  void _toggleHamburgerVisibility() {
    setState(() {
      _isHamburgerVisible = !_isHamburgerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Show the custom dialog when the back button is pressed
        _showCustomDialog(context);
        return false; // Return false to prevent the default back action
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(deviceWidth, 60), // Adjust app bar height if needed
          child: Padding(
            padding: const EdgeInsets.only(top: 19), // Set 19px padding from the top
            child: CustomAppBar(onHamburgerTap: _toggleHamburgerVisibility, onFrameTap: () {  },),
          ),
        ),
        body: Stack(
          children: [
            // Background layers
            Positioned.fill(
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: const Color(0x12121233),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: const Color(0xFF063434).withOpacity(0.8),
              ),
            ),
            // Main content
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              bottom: 0, // Adjust for the navigation bar
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(8, 119, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomCard(),
                    const SizedBox(height: 10),
                    Component2(),
                    const Component3(),
                    const Component4(),
                    // Container below Component4 with margin and Component5 inside it
                    Container(
                      margin: const EdgeInsets.only(top: 59),
                      child: const Component5(),
                    ),
                  ],
                ),
              ),
            ),
            // Hamburger Menu
            Hamburger(
              isVisible: _isHamburgerVisible,
              onBackgroundTap: _toggleHamburgerVisibility,
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ExitDialog();  // Use the ExitDialog widget
      },
    );
  }
}
