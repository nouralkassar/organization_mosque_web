import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changedlocal.dart';
import '../widget/lunguage/custombuttonlanguge.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white1,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.TitleBoarding,
                  fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButtonLang(
              textbutton: 'Ar',
              onPressed: () {
                controller.changedLang("ar");
                Get.toNamed(AppRoute.login);
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonLang(
              textbutton: 'En',
              onPressed: () {
                controller.changedLang("en");
                Get.toNamed(AppRoute.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
