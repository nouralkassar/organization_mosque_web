import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organization_mosque_web/core/constant/color.dart';

/// دالة عامة لعرض Dialog ديناميكي
void showCustomDialog({
  required String title,             // العنوان
  required String message,           // النص
  IconData icon = Icons.info_outline, // أيقونة (افتراضي info)
  Color? iconColor,                  // لون الأيقونة
  Color? backgroundColor,            // لون خلفية الديالوج
  String confirmText = "Close",      // نص الزر
  Color? confirmTextColor,           // لون نص الزر
  Color? confirmButtonColor,         // لون خلفية الزر
}) {
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
      color: iconColor ?? AppColor.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    backgroundColor: backgroundColor ?? AppColor.lightBeige,
    radius: 15,
    content: Column(
      children: [
        Icon(
          icon,
          color: iconColor ?? AppColor.primaryColor,
          size: 60,
        ),
        const SizedBox(height: 10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    confirm: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: confirmButtonColor ?? AppColor.lightBeige,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () => Get.back(),
      icon: Icon(Icons.close, color: confirmTextColor ?? AppColor.bluish),
      label: Text(
        confirmText,
        style: TextStyle(color: confirmTextColor ?? AppColor.bluish),
      ),
    ),
  );
}
