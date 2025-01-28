import 'package:d1mm4/components/Buisness_Account.dart';
import 'package:d1mm4/components/D1CM6.dart';
import 'package:d1mm4/components/MyPlan.dart';
import 'package:d1mm4/components/Step5.dart';
import 'package:d1mm4/components/Step_4.dart';
import 'package:d1mm4/components/Verification.dart';
import 'package:d1mm4/components/kyc.dart';
import 'package:d1mm4/homepage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final getPages = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/business-account', page: () => const BusinessAccount()),
    GetPage(name: '/verification', page: () => const Verification()),
    GetPage(name: '/kyc', page: () => const KYC()),
    GetPage(name: '/step4', page: () => const Step4()),
    GetPage(name: '/step5', page: () => const Step5()),
    GetPage(name: '/myplan', page: () => const Myplan()),
    GetPage(name: '/d1cm6', page: () => const D1CM6()),
  ];

  static const String home = '/';
  static const String businessAccount = '/business-account';
  static const String verification = '/verification';
  static const String kyc = '/kyc';
  static const String step4 = '/step4';
  static const String myplan = '/myplan';
  static const String d1cm6 = '/d1cm6';
}
