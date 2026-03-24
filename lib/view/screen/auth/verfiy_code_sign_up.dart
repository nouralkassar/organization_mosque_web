import 'package:organization_mosque_web/controller/auth/verfiycodesignup.dart';
import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/class/handling_data_view.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitlleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(VerfiyCodeSignUpcontrollerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          //   elevation: 0.0,
          title: Text("21".tr ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey,),
          ),),
        body:GetBuilder<VerfiyCodeSignUpcontrollerImp>(builder: (controller) =>
    handlingDataRequest(statusRequest:  controller.statusRequest,
    widget: Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
          child: ListView(children: [
            CustomTextTitleAuth(text: "22".tr,),
            SizedBox(height: 10,),
            CustomTextBodyAuth(text: "23".tr,),
            SizedBox(height: 65,),

            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DAB),
              showFieldAsBox: true,
              onCodeChanged: (String Code){

              },
              onSubmit: (String verificationCode){
                controller.goToSuccessSignUp(verificationCode);
              },
            )

          ],),




        ),
    )
        )
    );
  }
}
