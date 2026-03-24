import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/auth/verfiycode_signup.dart';

abstract class VerfiyCodeSignUpcontroller extends GetxController{
  checkCode();
  goToSuccessSignUp(String VerifyCodeSignUp);
}
class   VerfiyCodeSignUpcontrollerImp extends VerfiyCodeSignUpcontroller{
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest =StatusRequest.none;

  @override
  checkCode() {

  }

  @override
  goToSuccessSignUp(VerifyCodeSignUp) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!,VerifyCodeSignUp
    );
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successsignup);
      } else {
        Get.defaultDialog(
          title: 'warning',
          middleText: 'Verify Code Not Correct',
        );
        statusRequest = StatusRequest.failure;

      }
    }
    update();

  }
  @override
  void onInit() {
   email =Get.arguments['email'];
    super.onInit();
  }


}