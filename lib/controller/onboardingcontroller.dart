import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/core/services/services.dart';
import 'package:organization_mosque_web/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///  لي abstract لان بيوضحلي كل ميثود بكل سكرين
abstract class OnBoradingController extends GetxController {
  // الفنكشن الاولة مهمتها بس اضغط على الزر بتنقلي على البيج الي بعدها تبع زر continue
  next();
  ///// لما بتنقل بالبيج بشكل عام من دون الضغط على الزر بيتفعل الكونرولر
  // انتبه انو هون بتستقبل متغير يعني يفي البداية بتكون البيج 0 لما بتنقل للصفحة التانية بيصير المتغير 1 وهيك للباقي
  onPageChanged(int index);
}

class OnBoardingcontrollerImp extends OnBoradingController {
  int currentPage = 0;
  late PageController pagecontroller;
  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pagecontroller.animateToPage(currentPage,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
