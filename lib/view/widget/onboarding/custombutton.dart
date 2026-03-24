import 'package:organization_mosque_web/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingcontrollerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(bottom: 30),
child: MaterialButton(
padding:const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
textColor:Colors.white,
onPressed: (){
  controller.next();
},
color:AppColor.primaryColor ,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30), // هنا تتحكم في نصف القطر
  ),
child: Text("Continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
),

);
  }
}
