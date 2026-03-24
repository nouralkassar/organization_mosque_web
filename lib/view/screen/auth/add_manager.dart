import 'package:organization_mosque_web/controller/auth/add_manamger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddUserControllerImp());

    return Scaffold(
      backgroundColor: AppColor.white1,
      body: GetBuilder<AddUserControllerImp>(
        builder: (controller) => handlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: AppColor.Begie.withOpacity(0.2),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Form(
                      key: controller.formstate,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColor.Begie.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Add User",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: AppColor.bluish),
                            ),
                            const SizedBox(height: 20),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // العمود الأول
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomTextFormAuth(
                                        hindtext: "13".tr,
                                        labeltext: "12".tr,
                                        iconData: Icons.person,
                                        mycontroller: controller.full_name,
                                        valid: (val) =>
                                            validInput(val!, 3, 100, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "6".tr,
                                        labeltext: "5".tr,
                                        iconData: Icons.email_outlined,
                                        mycontroller: controller.email,
                                        valid: (val) =>
                                            validInput(val!, 5, 100, "email"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),

                                      GetBuilder<AddUserControllerImp>(
                                        builder: (controller) =>
                                            CustomTextFormAuth(
                                              obscureText:
                                              controller.isShowPassword,
                                              onTapIcon: () {
                                                controller.showPassword();
                                              },
                                              hindtext: "8".tr,
                                              labeltext: "7".tr,
                                              iconData: Icons.lock_outline,
                                              mycontroller: controller.password,
                                              valid: (val) => validInput(
                                                  val!, 5, 80, "password"),
                                              isNumber: false,
                                            ),
                                      ),
                                      const SizedBox(height: 10),

                                      GetBuilder<AddUserControllerImp>(
                                        builder: (controller) =>
                                            CustomTextFormAuth(
                                              obscureText:
                                              controller.isShowPassword,
                                              onTapIcon: () {
                                                controller.showPassword();
                                              },
                                              hindtext: "8".tr,
                                              labeltext: "7".tr,
                                              iconData: Icons.lock_outline,
                                              mycontroller: controller
                                                  .password_confirmation,
                                              valid: (val) => validInput(
                                                  val!, 5, 80, "password"),
                                              isNumber: false,
                                            ),
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "mother",
                                        labeltext: "mother",
                                        iconData: Icons.person,
                                        mycontroller: controller.mother_name,
                                        valid: (val) =>
                                            validInput(val!, 6, 13, "name"),
                                        isNumber: false,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 15),

                                // العمود الثاني
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomTextFormAuth(
                                        hindtext: "old",
                                        labeltext: "old",
                                        iconData: Icons.person,
                                        mycontroller: controller.old,
                                        valid: (val) =>
                                            validInput(val!, 2, 3, "number"),
                                        isNumber: true,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "15".tr,
                                        labeltext: "14".tr,
                                        iconData: Icons.phone_android,
                                        mycontroller: controller.mynumber,
                                        valid: (val) =>
                                            validInput(val!, 6, 10, "number"),
                                        isNumber: true,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "location",
                                        labeltext: "location",
                                        iconData: Icons.location_on,
                                        mycontroller: controller.addess,
                                        valid: (val) =>
                                            validInput(val!, 2, 13, "name"),
                                        isNumber: true,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "work",
                                        labeltext: "work",
                                        iconData: Icons.work,
                                        mycontroller: controller.ago_work,
                                        valid: (val) =>
                                            validInput(val!, 6, 13, "name"),
                                        isNumber: true,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "study",
                                        labeltext: "study",
                                        iconData: Icons.menu_book,
                                        mycontroller: controller.studing,
                                        valid: (val) =>
                                            validInput(val!, 6, 13, "name"),
                                        isNumber: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // ✅ زر الإرسال
                            CustomButtonAuth(
                              text: "11".tr,
                              onPressed: () {
                                controller.AddManager();
                              },
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
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
