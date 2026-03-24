import 'package:organization_mosque_web/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/resetpasswordcontroller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitlleauth.dart';
import '../../../widget/auth/textsignup.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(resetPasswordControllerImp());
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: AppColor.white,
        //   //   elevation: 0.0,
        //   title: Text("25".tr ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey,),
        //   ),),
        body: GetBuilder<resetPasswordControllerImp>(builder: (controller) =>
    handlingDataRequest(statusRequest:  controller.statusRequest,
    widget:
    Stack(
      children:[
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
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
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
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CustomTextTitleAuth(text: "26".tr,),
                      SizedBox(height: 10,),
                      CustomTextBodyAuth(text: "27".tr,),
                      SizedBox(height: 65,),

                      GetBuilder<resetPasswordControllerImp>(builder: (controller) =>
                          CustomTextFormAuth(
                            obscureText: controller.isShowPassword,
                            onTapIcon: (){
                              controller.showPassword();
                            },
                            hindtext: "8".tr,
                            labeltext: "7".tr,
                            iconData: Icons.lock_outline,
                            mycontroller: controller.password,
                            valid: (val){
                              return validInput(val!, 5, 80, "password");
                            }, isNumber: false,
                          ),
                      ),

                      GetBuilder<resetPasswordControllerImp>(builder: (controller) => CustomTextFormAuth(
                        obscureText: controller.isShowPassword,
                        onTapIcon: (){
                          controller.showPassword();
                        },
                        hindtext: "29".tr,
                        labeltext: "7".tr,
                        iconData: Icons.lock_outline,
                        mycontroller: controller.repassword,
                        valid: (val){
                          return validInput(val!, 5, 80, "password");
                        }, isNumber: false,
                      ),),



                      CustomButtonAuth(text: "28".tr,onPressed: (){
                        controller.goToSuccessResetPassword();
                      },),

                    ],),
                  ),
                ),
        ),
   ] ))
          ,)
    );
  }
}
