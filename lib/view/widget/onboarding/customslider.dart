// import 'package:ecommaerce_course/controller/onboardingcontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constant/color.dart';
// import '../../../data/datasource/static/static.dart';

// class CustomSliderOnBoarding extends GetView<OnBoardingcontrollerImp> {
//   const CustomSliderOnBoarding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: controller.pagecontroller,
//       onPageChanged: (val) {
//         controller.onPageChanged(val);
//       },
//       itemCount: onBoardingList.length,
//       itemBuilder: (context, i) => Column(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Image.asset(
//             onBoardingList[i].image!,
//             width: 500,
//             height: 300,
//             //  height: Get.width/1.3,
//             fit: BoxFit.fill,
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Text(
//             onBoardingList[i].title!,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 40,
//                 color: AppColor.TitleBoarding),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Container(
//             width: double.infinity,
//             alignment: Alignment.center,
//             child: Text(
//               onBoardingList[i].body!,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 height: 2,
//                 color: AppColor.TitleBoarding,
//                 fontSize: 20,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:organization_mosque_web/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingcontrollerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: controller.onPageChanged,
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),

          /// ✅ ClipOval Image (دائرية)
          ClipOval(
            child: Image.asset(
              onBoardingList[i].image!,
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

          /// ✅ Title باستخدام Theme
          Text(
            onBoardingList[i].title!,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          /// ✅ Description باستخدام Theme
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                color: AppColor.TitleBoarding,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
