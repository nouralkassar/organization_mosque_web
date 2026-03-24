import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 233, 212, 166), // لون بيج
          title: Text(
            title,
            style: const TextStyle(
              color: AppColor.bluish, // لون الخط في العنوان
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
              color: Colors.black87, // لون الخط في المحتوى
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'تأكيد',
                style: TextStyle(color: AppColor.bluish), // لون زر التأكيد
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
            TextButton(
              child: const Text(
                'إلغاء',
                style: TextStyle(color: AppColor.bluish), // لون زر الإلغاء
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF5F5DC), // لون بيج
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.brown, // لون العنوان
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
              color: Colors.black87, // لون المحتوى
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'موافق',
                style: TextStyle(color: Colors.brown), // لون الزر
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
