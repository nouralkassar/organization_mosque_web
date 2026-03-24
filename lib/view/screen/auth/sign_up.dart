import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitlleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          //   elevation: 0.0,
          title: Text("11".tr ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey,),
          ),),
        body:
          WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(builder: (controller) =>
    handlingDataRequest(statusRequest:  controller.statusRequest,
    widget:  Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            child: Form(
              key: controller.formstate,
              child: ListView(children: [
                CustomTextTitleAuth(text: "3".tr,),
                SizedBox(height: 10,),
                CustomTextBodyAuth(text: "16".tr,),
                SizedBox(height: 65,),
                CustomTextFormAuth(
                  hindtext: "13".tr,
                  labeltext: "12".tr,
                  iconData: Icons.person, mycontroller: controller.name,
                  valid: (val){
                    return validInput(val!, 3, 100, "name");
                  }, isNumber: false,
                ),
                CustomTextFormAuth(
                  hindtext: "6".tr,
                  labeltext: "5".tr,
                  iconData: Icons.email_outlined,
                  mycontroller: controller.email,
                  valid: (val){
                    return validInput(val!, 5, 100, "email");
                  }, isNumber: false,
                ),

                CustomTextFormAuth(
                  hindtext: "15".tr,
                  labeltext: "14".tr,
                  iconData: Icons.phone_android,
                  mycontroller: controller.phone,
                  valid: (val){
                    return validInput(val!, 6, 13, "phone");
                  }, isNumber: true,
                ),
                GetBuilder<SignUpControllerImp>(builder: (controller) =>
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

                CustomButtonAuth(text: "11".tr,onPressed: (){
                  controller.SignUp();
                },),
                SizedBox(height: 30,),
                CustomTextSignUpOrSignIn(textOne: "17".tr,textTow: "2".tr,onTap: (){
                  controller.goToLogIn();
                },),
              ],),
            ),
          ),)
             
        )
        )
    );
  }
}
