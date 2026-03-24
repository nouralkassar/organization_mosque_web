import 'package:organization_mosque_web/controller/onboardingcontroller.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/view/widget/onboarding/custombutton.dart';
import 'package:organization_mosque_web/view/widget/onboarding/customslider.dart';
import 'package:organization_mosque_web/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingcontrollerImp());

    return Container(
      decoration: BoxDecoration(
        color: AppColor.white1,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8), // قلل الهوامش حتى لا يضيق العرض
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 40),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                CustomDotControllerOnBoarding(),
                Spacer(flex: 2),
                CustomButtonOnBoarding()
              ],
            ),
          )
        ],
      ),
    );
  }
}
