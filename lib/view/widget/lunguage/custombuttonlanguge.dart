import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 100,),
        width: 500,
        child:  MaterialButton(
          color: AppColor.primaryColor,
          textColor: Colors.white,
          onPressed: onPressed,

          child: Text(textbutton,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        ),),
    )
    ;
  }
}
