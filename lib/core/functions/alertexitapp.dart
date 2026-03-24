import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {

  return await Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق ",
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: Text("confirm"),),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("cancel"),),
    ]);
  return Future.value(true);

}
/*
* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool> alertExitApp() async {
  // استخدم الدالة async و await هنا لضمان أن تكون النتيجة صحيحة
  bool result = await Get.defaultDialog(
    title: "تنبيه",
    middleText: "هل تريد الخروج من التطبيق؟",
    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("تأكيد"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("إلغاء"),
      ),
    ],
  );

  // هنا يمكنك إرجاع القيمة بناءً على النتيجة التي حصلت عليها
  return result;
}
*/