import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../animation/auth/animation_card_textform_login.dart';
import '../../../controller/auth/logincontroller.dart';
import '../../../core/class/handling_data_view.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
      body: Stack(
        children: [
// 🔹 صورة الخلفية مع فلتر سطوع
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1),
                BlendMode.lighten,
              ),
              child: Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),

// 🔹 طبقة تعتيم فوقها
          Positioned.fill(
            child: Container(
              color: AppColor.Begie.withOpacity(0.1),
            ),
          ),

          // 🔹 محتوى تسجيل الدخول
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              width: 650,
              decoration: BoxDecoration(
                color: AppColor.Begie.withOpacity(0.3), // بيج مع شفافية 30%
// 🔹 يمكن تعديل القيمة حسب الشفافية المطلوبة
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.Begie.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: GetBuilder<LoginControllerImp>(
                builder: (controller) => handlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formstate,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "تسجيل الدخول",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                            color: AppColor.bluish,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: AppColor.Begie,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const LogoAuth(),
                        const SizedBox(height: 25),
                        const AnimatedLoginCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
