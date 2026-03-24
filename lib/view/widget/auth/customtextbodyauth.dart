import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 19, // ← غيّر الرقم لحجم الخط المطلوب
                  color: Color(
                      0xff5c4033), // ← غيّر اللون حسب الحاجة (مثلاً AppColor.primaryColor)
                  fontWeight: FontWeight.bold, // (اختياري) تعطي ثقل للخط
                )));
  }
}
