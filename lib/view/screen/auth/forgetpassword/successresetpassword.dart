import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/successresetpassword.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =Get.put(SuccessResetPasswordControllerImp());
    return   Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: AppColor.white,
        //   //   elevation: 0.0,
        //   title: Text("31".tr ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey,),
        //   ),),
        body:

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
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.Begie.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.Begie.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 200,),
                  Center(
                    child: Icon(
                      Icons.check_circle_outline,
                      color: AppColor.sunsetOrange,
                      size: 200,
                    ),
                  ),
                  Text("تم تغيير كلمة المرور بنجاح",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: AppColor.bluish,
                      )),
               //   Spacer(),
                  SizedBox(height: 200,),

                  SizedBox(
                    width: double.infinity,
                    child: CustomButtonAuth(
                      text: "32".tr,
                      onPressed: () {
                        controller.goToPagrLogin();
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            )
            ,
       ] )
    );

  }
}
