import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 28, // ← غيّر الرقم لحجم الخط المطلوب
              color: AppColor
                  .bluish, // ← غيّر اللون حسب الحاجة (مثلاً AppColor.primaryColor)
              fontWeight: FontWeight.bold, // (اختياري) تعطي ثقل للخط
            ));
  }
}
