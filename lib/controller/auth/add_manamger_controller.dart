import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/auth/add_manger.dart';
import 'package:organization_mosque_web/data/datasource/remote/auth/signup.dart';
import 'package:organization_mosque_web/view/screen/auth/add_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../view/widget/dialogfaular.dart';

abstract class AddUserController extends GetxController {
  AddManager();

}

class AddUserControllerImp extends AddUserController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController full_name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController password_confirmation;
  late TextEditingController mother_name;
  late TextEditingController old;
  late TextEditingController mynumber;
  late TextEditingController addess;
  late TextEditingController ago_work;
  late TextEditingController studing;

  StatusRequest statusRequest=StatusRequest.none;

  AddUserData addmanagertData = AddUserData(Get.find());

  List data = [];

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  AddManager() async {
    if(password.text != password_confirmation.text)
    {
      return   showCustomDialog(
        title: "Reset Password",
        message: "Please Matech your Password",
        icon: Icons.password,
        iconColor: AppColor.bluish,
      );
    }
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addmanagertData.postData(
        full_name.text,
        email.text,
        password.text,
        password_confirmation.text,
        mother_name.text,
        old.text,
        mynumber.text,
        addess.text,
        ago_work.text,
        studing.text,
      );
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          Get.defaultDialog(
            title: 'success',
            middleText: 'Added Successfully',
          );
          Get.delete<AddUserControllerImp>();

          Get.offNamed(AppRoute.Dashboard);
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
  void onInit() {
    full_name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    password_confirmation =TextEditingController();
    mother_name =TextEditingController();
    old =TextEditingController();
    mynumber =TextEditingController();
    addess =TextEditingController();
    ago_work =TextEditingController();
    studing =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    full_name.dispose();
    email.dispose();
    password.dispose();
    password_confirmation.dispose();
    mother_name.dispose();
    old.dispose();
    mynumber.dispose();
    addess.dispose();
    ago_work.dispose();
    studing.dispose();

    super.dispose();
  }
}
