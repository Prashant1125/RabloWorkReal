import 'package:d1mm4/components/Container.dart';
import 'package:d1mm4/components/Progress_Lost.dart';
import 'package:d1mm4/components/accessiblitybox.dart';
import 'package:d1mm4/components/app_bar_1.dart';
import 'package:d1mm4/components/custom_bottom_navigation_bar.dart';
import 'package:d1mm4/components/hamburger.dart';
import 'package:d1mm4/components/horizontalinforbox.dart';
import 'package:d1mm4/components/quickinfo.dart';
import 'package:d1mm4/components/welcomebox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHamburgerVisible = false;
  bool _NotiVisible = false;

  void _toggleHamburgerVisibility() {
    setState(() {
      _isHamburgerVisible = !_isHamburgerVisible;
    });
  }

  void _toggleNotiVisiblty() {
    setState(() {
      _NotiVisible = !_NotiVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        _showCustomDialog(context);
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
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
            Positioned(
              top: deviceHeight * 0.06, // 6% from top
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  deviceWidth * 0.02, // 2% left padding
                  deviceHeight * 0.15, // 15% top padding
                  deviceWidth * 0.02, // 2% right padding
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomCard(),
                    SizedBox(height: deviceHeight * 0.01), // 1% height spacing
                    Component2(),
                    const Component3(),
                    const Component4(),
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight * 0.05), // 7% margin top
                      child: const Component5(),
                    ),
                    // Add an Expanded widget to ensure no overflow
                    Expanded(
                      child: Container(), // Placeholder to avoid overflow
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * 0.025, // 2.5% from top
              left: 0,
              right: 0,
              child: CustomAppBar(
                onHamburgerTap: _toggleHamburgerVisibility,
                onFrameTap: _toggleNotiVisiblty,
              ),
            ),
            Hamburger(
              isVisible: _isHamburgerVisible,
              onBackgroundTap: _toggleHamburgerVisibility,
            ),
            NotificationContainer(
              isVisible: _NotiVisible,
              onBackgroundTap: _toggleNotiVisiblty,
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
        return const ExitDialog();
      },
    );
  }
}
