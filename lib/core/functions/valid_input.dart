import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  List<String> allowedValues = ["A", "B", "C"];
  List<String> typeValues = [
    "ذكور",
    "إناث",
  ];
  List<String> dayValues = [
    "الأحد",
    "الاثنين",
    "الثلاثاء",
    "الاربعاء",
    "الخميس",
    "الجمعة",
    "السبت"
  ];
  if (type == "day") {
    if (!dayValues.contains(val)) {
      return "القيمة المدخلة غير صالحة"; // ممكن تعوّض برسالة ترجمة
    }
  }
  if (type == "type") {
    if (!typeValues.contains(val)) {
      return "القيمة المدخلة غير صالحة"; // ممكن تعوّض برسالة ترجمة
    }
  }

  if (type == "enum") {
    if (!allowedValues.contains(val)) {
      return "القيمة المدخلة غير صالحة"; // ممكن تعوّض برسالة ترجمة
    }
  }

  if (type == "name") {
    // if(!GetUtils.isUsername(val)){
    //   return "33".tr;
    // }
  }
  if (type == "date") {
    // التحقق إذا التاريخ مكتوب بالصيغة الصحيحة (yyyy-mm-dd مثلاً)
    RegExp dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(val)) {
      return "الرجاء إدخال تاريخ صالح بصيغة yyyy-mm-dd";
    }

    try {
      DateTime.parse(val); // يحاول يحوله لتاريخ
    } catch (e) {
      return "تاريخ غير صالح";
    }
  }
  if (type == "time") {
    // التحقق إذا الوقت مكتوب بالصيغة الصحيحة HH:mm
    RegExp timeRegex = RegExp(r'^([01]\d|2[0-3]):([0-5]\d)$');
    if (!timeRegex.hasMatch(val)) {
      return "الرجاء إدخال وقت صالح بصيغة HH:mm";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "34".tr;
    }
  }
  if (type == "boolean") {
    // if(!GetUtils.isEmail(val)){
    //   return "34".tr;
    // }
  }

  if (type == "number") {
    if (!GetUtils.isNumericOnly(val)) {
      return "الرجاء إدخال أرقام فقط";
    }
  }
  if (type == "password") {
    RegExp regex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(val)) {
      return "كلمة المرور يجب أن تحتوي على حرف كبير وصغير ورقم ورمز خاص، وأن لا تقل عن 8 أحرف.";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "35".tr;
    }
  }

  if (type == "image") {
    // if(!GetUtils.isPhoneNumber(val)){
    //   return "35".tr;
    // }
  }
  if (val.length < min) {
    return "36".tr + min.toString();
  }

  if (val.length > max) {
    return "37".tr + max.toString();
  }
  // if(val.isEmpty){
  //   return "38".tr ;
  // }
}
