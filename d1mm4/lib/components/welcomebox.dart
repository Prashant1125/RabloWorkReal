import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/card_controller.dart';

class CustomCard extends StatelessWidget {
  final CardController controller;

  const CustomCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the device's dimensions
    // final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.zero, // Removes default margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF2F5B6C),
      child: SizedBox(
        width: double.infinity, // Use 90% of device width
        height: deviceHeight * 0.25, // Use 25% of device height
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Barlow Semi Condensed',
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'You are One-Step Closer to creating your App',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Row(
                            children: [
                              Obx(() => Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            controller.currentStep.value >=
                                                    index
                                                ? const Color.fromRGBO(
                                                    184, 254, 34, 1)
                                                : Colors.grey,
                                        child: SvgPicture.asset(
                                          'assets/step${index + 1}.svg',
                                          width: 14,
                                          height: 14,
                                          color: controller.currentStep.value >=
                                                  index
                                              ? const Color(0xFF003366)
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  )),
                              if (index < 4)
                                Obx(() => SizedBox(
                                      width: 16, // Adjust spacing between steps
                                      child: Container(
                                        height: 6,
                                        color:
                                            controller.currentStep.value > index
                                                ? const Color.fromRGBO(
                                                    184, 254, 34, 1)
                                                : Colors.grey,
                                      ),
                                    )),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '|',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Obx(() => Text(
                            '${controller.currentPercentage}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.currentStep.value < 4) {
                    controller.changeStep(controller.currentStep.value + 1);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(184, 254, 34, 1),
                  minimumSize: Size(double.infinity, deviceHeight * 0.05),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Obx(() => Text(
                      controller.currentButtonText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Color(0xFF121212),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
