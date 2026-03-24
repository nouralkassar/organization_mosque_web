import 'package:flutter/material.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';
import '../../view/widget/dialogfaular.dart';

abstract class resetPasswordController extends GetxController{
  resetPasword();
  goToSuccessResetPassword();
}
class resetPasswordControllerImp extends resetPasswordController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();

  late TextEditingController password ;
  late TextEditingController repassword ;

  bool isShowPassword = true;
  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? code;
  showPassword(){
    isShowPassword = isShowPassword == true ?false :true;
    update();
  }


  @override
  resetPasword() {

  }

  @override
  goToSuccessResetPassword() async{

   if(password.text != repassword.text)
     {
       return   showCustomDialog(
         title: "Reset Password",
         message: "Please Matech your Password",
         icon: Icons.password,
         iconColor: AppColor.bluish,
       );
     }
    var formData =formstate.currentState;

    if(formData!.validate()){
      statusRequest = StatusRequest.loading;
      update();

      var response = await resetPasswordData.postData(
        code!,
        password.text,
          repassword.text

      );
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "password has been successfully reset") {
          Get.offNamed(AppRoute.successresertpassword);
        } else {

          statusRequest = StatusRequest.failure;
          print(" bbbbbbbbbbbbb valid");
        }
      }
      update();
    }else{

      print(" not valid");
    }
   }
  @override
  void onInit() {
    code=Get.arguments['code'];
    password =TextEditingController();
    repassword =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {

    password.dispose();
    repassword.dispose();
    super.dispose();
  }


}