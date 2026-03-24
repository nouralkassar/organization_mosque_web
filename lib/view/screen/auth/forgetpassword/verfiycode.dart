import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../controller/forgetpassword/verfiycodecontroller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitlleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(VerfiyCodecontrollerImp());
    return Scaffold(
      backgroundColor: AppColor.white1,
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: AppColor.white1,
        //   //   elevation: 0.0,
        //   title: Text("21".tr ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor,),
        //   ),),
        body: GetBuilder<VerfiyCodecontrollerImp>(builder: (controller) =>
    handlingDataRequest(statusRequest:  controller.statusRequest,
    widget:  Stack(
      children: [
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
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            width: 650,
            height: 500,
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
              //      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                    child: ListView(children: [
                      SizedBox(height: 150,),
                      CustomTextTitleAuth(text: "22".tr,),
                      SizedBox(height: 20,),
                      CustomTextBodyAuth(text: "23".tr,),
                      SizedBox(height: 65,),

                      OtpTextField(
                        fieldWidth: 45.0,
                        borderRadius: BorderRadius.circular(20),
                        numberOfFields: 6,
                        borderColor: AppColor.bluish, // اللون الأساسي للـ border
                        focusedBorderColor: AppColor.bluish, // لون الـ border عند التركيز
                        enabledBorderColor: AppColor.bluish, // 🎯 هون عالجت مشكلتك
                        showFieldAsBox: true,
                        textStyle: TextStyle(
                          color: AppColor.bluish, // لون النص داخل الخانات
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        onCodeChanged: (String code) {
                          // كود اختياري
                        },
                        onSubmit: (String verificationCode) {
                          controller.goToresetPassword(verificationCode);
                        },
                      )


                    ],),




          ),
        ),
      ],
    ))
          ,)
    );
  }
}
