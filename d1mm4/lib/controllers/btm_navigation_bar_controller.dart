import 'package:d1mm4/homepage.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  List navBarAssetsPath = [
    'assets/BarCode.svg',
    'assets/Home.svg',
    'assets/Person.svg'
  ];

  void changeIndex(int index) {
    _currentIndex.value = index;
  }
}
