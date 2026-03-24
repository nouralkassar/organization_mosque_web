import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/forgetpassword/check_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  CheckEmailData checkEmailData=CheckEmailData(Get.find());
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  StatusRequest statusRequest =StatusRequest.none;

  late TextEditingController email ;


  @override
  checkEmail() async{
if(formstate.currentState!.validate()){
  statusRequest = StatusRequest.loading;
  update();
  var response = await checkEmailData.postData(
    email.text,



  );
  print("==============================response $response");
  statusRequest = handlingData(response);
  if (StatusRequest.success == statusRequest) {
    if (response['message'] == "code.sent") {
      Get.offNamed(AppRoute.verfiycode,arguments: {
        "email":email.text
      });
    } else {
      Get.defaultDialog(
        title: 'warning',
        middleText: 'Email OR Not found',
      );
      statusRequest = StatusRequest.failure;

    }
  }
  update();

}
  }


  @override
  void onInit() {
   email =TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {

    email.dispose();

    super.dispose();
  }


}