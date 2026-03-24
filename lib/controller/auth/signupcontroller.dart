import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/auth/signup.dart';
import 'package:organization_mosque_web/view/screen/auth/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class SignUpController extends GetxController {
  SignUp();
  goToLogIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

   StatusRequest statusRequest=StatusRequest.none;

  SignupData signuptData = SignupData(Get.find());

  List data = [];

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  SignUp() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signuptData.postData(
        name.text,
        password.text,
        email.text,
        phone.text,
      );
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiycodesignup,arguments: {
            "email" : email.text
          });

          /// طريقة اخرى لحذف المعلومات من sign up لما رد ارجعلها مرة اخرى من Login
          /// في صفح
          //Get.delete<SignUpControllerImp>();
          print("valid");
        } else {
          Get.defaultDialog(
            title: 'warning',
            middleText: 'Phone number OR Email Already exists',
          );
          statusRequest = StatusRequest.failure;

        }
      }
      update();
    } else {
      print(" not valid");
    }
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
