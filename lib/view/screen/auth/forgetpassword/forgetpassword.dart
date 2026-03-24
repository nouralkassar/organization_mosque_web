// import 'package:ecommaerce_course/controller/forgetpassword/forgetpasswordcontroller.dart';
// import 'package:ecommaerce_course/core/class/statusrequest.dart';
// import 'package:ecommaerce_course/core/constant/color.dart';
// import 'package:ecommaerce_course/core/functions/valid_input.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../core/class/handling_data_view.dart';
// import '../../../widget/auth/custombuttonauth.dart';
// import '../../../widget/auth/customtextbodyauth.dart';
// import '../../../widget/auth/customtextformauth.dart';
// import '../../../widget/auth/customtexttitlleauth.dart';

// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ForgetPasswordControllerImp());
//     return Scaffold(
//         backgroundColor: AppColor.white1,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: AppColor.white1,
//           //   elevation: 0.0,
//           title: Text(
//             "18".tr,
//             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                   color: AppColor.bluish,
//                 ),
//           ),
//         ),
//         body: GetBuilder<ForgetPasswordControllerImp>(
//           builder: (controller) => handlingDataRequest(
//               statusRequest: controller.statusRequest,
//               widget: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                 child: Form(
//                   key: controller.formstate,
//                   child: ListView(
//                     children: [
//                       SizedBox(
//                         height: 50,
//                       ),
//                       CustomTextTitleAuth(
//                         text: "19".tr,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       CustomTextBodyAuth(
//                         text: "16".tr,
//                       ),
//                       SizedBox(
//                         height: 65,
//                       ),
//                       CustomTextFormAuth(
//                         hindtext: "6".tr,
//                         labeltext: "5".tr,
//                         iconData: Icons.email_outlined,
//                         mycontroller: controller.email,
//                         valid: (val) {
//                           return validInput(val!, 5, 100, "email");
//                         },
//                         isNumber: false,
//                       ),
//                       CustomButtonAuth(
//                         text: "20".tr,
//                         onPressed: () {
//                           controller.checkEmail();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//         ));
//   }
// }

import 'package:organization_mosque_web/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/core/functions/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/class/handling_data_view.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitlleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => handlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              // ✅ خلفية الصورة
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ✅ طبقة شفافة فوق الخلفية
              Positioned.fill(
                child: Container(
                  color: AppColor.Begie.withOpacity(0.2),
                ),
              ),

              // ✅ المحتوى الأساسي
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ✅ عنوان "نسيت كلمة المرور" خارج البوكس
                        Text(
                          "18".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColor.bluish, fontSize: 32),
                        ),
                        const SizedBox(height: 20), // مسافة بين النص والبوكس

                        // ✅ البوكس
                        Form(
                          key: controller.formstate,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxWidth: 900, maxHeight: 400), // 👈 العرض
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColor.Begie.withOpacity(
                                    0.5), // 👈 لون البوكس
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // ✅ باقي عناصر الفورم
                                  CustomTextTitleAuth(
                                    text: "19".tr,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextBodyAuth(
                                    text: "16".tr,
                                  ),
                                  const SizedBox(height: 40),
                                  CustomTextFormAuth(
                                    hindtext: "6".tr,
                                    labeltext: "5".tr,
                                    iconData: Icons.email_outlined,
                                    mycontroller: controller.email,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, "email");
                                    },
                                    isNumber: false,
                                  ),
                                  const SizedBox(height: 25),
                                  CustomButtonAuth(
                                    text: "20".tr,
                                    onPressed: () {
                                      controller.checkEmail();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
