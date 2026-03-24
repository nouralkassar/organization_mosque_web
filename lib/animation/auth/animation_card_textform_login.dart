import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/logincontroller.dart';
import '../../../../core/functions/valid_input.dart';

import '../../../../core/constant/color.dart';
import '../../view/widget/auth/custombuttonauth.dart';
import '../../view/widget/auth/customtextformauth.dart';

class AnimatedLoginCard extends StatefulWidget {
  const AnimatedLoginCard({super.key});

  @override
  State<AnimatedLoginCard> createState() => _AnimatedLoginCardState();
}

class _AnimatedLoginCardState extends State<AnimatedLoginCard> {
  double _widthFactor = 0.0;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        _widthFactor = 0.85;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginControllerImp>();

    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 2000),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width * _widthFactor,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // color: AppColor.Begie,
            borderRadius: BorderRadius.circular(25),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     spreadRadius: 2,
            //     blurRadius: 12,
            //     offset: const Offset(0, 6),
            //   ),
            // ],
          ),
          child: Column(
            children: [
              CustomTextFormAuth(
                hindtext: "6".tr,
                labeltext: "5".tr,
                iconData: Icons.email_outlined,
                mycontroller: controller.email,
                valid: (val) => validInput(val!, 5, 100, "email"),
                isNumber: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColor.bluish),
                ),
              ),
              const SizedBox(height: 15),
              GetBuilder<LoginControllerImp>(
                builder: (_) => CustomTextFormAuth(
                  isNumber: false,
                  obscureText: controller.isShowPassword,
                  onTapIcon: () => controller.showPassword(),
                  hindtext: "8".tr,
                  labeltext: "7".tr,
                  iconData: Icons.lock_outline,
                  mycontroller: controller.password,
                  valid: (val) => validInput(val!, 8, 30, "password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColor.bluish),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => controller.goToForgetPassword(),
                    child: Text(
                      "9".tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 149, 68, 2),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 3), // الظل يبعد 2 بيكسل يمين وتحت
                            blurRadius: 6, // تعتيم الظل
                            color:
                                AppColor.Begie, // ظل باللون الأسود بنصف شفافية
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              CustomButtonAuth(
                text: "2".tr,
                onPressed: () => controller.login(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
