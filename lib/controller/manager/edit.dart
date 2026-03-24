import 'package:organization_mosque_web/controller/manager/view.dart';
import 'package:organization_mosque_web/controller/mosque/viewcontroller.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/manager/manager_data.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/mosque.dart';
import '../../data/model/manager_model.dart';
import 'package:collection/collection.dart'; // ضروري

abstract class EditManagerController extends GetxController {
  editManager();
}

class EditManagerControllerImp extends EditManagerController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ManagerModel? managerModel;

  late TextEditingController full_name;
  late TextEditingController mother_name;
  late TextEditingController birth_date;
  late TextEditingController national_id;
  late TextEditingController address;
  late TextEditingController previous_job;
  late TextEditingController education_level;
  late TextEditingController phone;
  late TextEditingController role;
  String? selectedMosqueId;
  List<MosqueModel> mosqueList = []; // أو MosqueModel إذا عندك موديل مخصص للمساجد

  StatusRequest statusRequest = StatusRequest.none;

  ManagerData managerData = ManagerData(Get.find());

  @override

  editManager() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      // ✅ الحصول على ID المسجد
      String selectedId = selectedMosqueId ?? managerModel!.mosqueId.toString();

      // ✅ البحث عن اسم المسجد عبر ID
      MosqueModel? selectedMosque = mosqueList.firstWhereOrNull(
            (mosque) => mosque.id.toString() == selectedId,
      );

      // ✅ استخراج الاسم أو تركه فارغ إذا لم يُعثر عليه
      String selectedMosqueName = selectedMosque?.name ?? "";

      // ✅ إعداد البيانات للإرسال
      Map data = {
        "full_name": full_name.text,
        "role": role.text,
        "mother_name": mother_name.text,
        "birth_date": birth_date.text,
        "national_id": national_id.text,
        "address": address.text,
        "previous_job": previous_job.text,
        "education_level": education_level.text,
        "phone": phone.text,
        "mosque_id": selectedId,
       // "mosque_name": selectedMosqueName, // ✅ تمت إضافته هنا
      };

      var response = await managerData.edit(data, managerModel!.id.toString());
      print("================== Manager Edit Response: $response");

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['success'] == true) {
          Get.offAllNamed(AppRoute.Dashboard);
          ViewAllManagerControllerImp c = Get.find();
          c.GetAllManager();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      print("❌ Form is not valid");
    }
  }
  void getAllMosquesForDropdown() async {
    print("🚀 بدي جيب المساجد ...");

    var response = await MosqueData(Get.find()).get();
    print("📥 Response: $response");

    if (response is! StatusRequest) {
      mosqueList = (response['data'] as List)
          .map((e) => MosqueModel.fromjson(e))
          .toList();

      print("✅ عدد المساجد بعد التحويل: ${mosqueList.length}");
      for (var mosque in mosqueList) {
        print("🕌 Mosque: ${mosque.id} - ${mosque.name}");
      }

      if (managerModel?.mosqueId != null) {
        final exists = mosqueList.any((m) => m.id.toString() == managerModel!.mosqueId.toString());
        if (exists) {
          selectedMosqueId = managerModel!.mosqueId.toString();
          print("🎯 Selected mosqueId = $selectedMosqueId");
        }
      }

      update(); // هذا لازم يخلّي الـ Dropdown يظهر
    } else {
      Get.snackbar("خطأ", "فشل تحميل المساجد");
    }
  }


  @override
  void onInit() {
    managerModel = Get.arguments['managerModel'];
    print("🔥 managerModel from arguments: ${managerModel?.toJson()}");

    full_name = TextEditingController(text: managerModel?.full_name ?? '');
    mother_name = TextEditingController(text: managerModel?.motherName ?? '');
    birth_date = TextEditingController(text: managerModel?.birthDate ?? '');
    national_id = TextEditingController(text: managerModel?.nationalId ?? '');
    address = TextEditingController(text: managerModel?.address ?? '');
    previous_job = TextEditingController(text: managerModel?.previousJob ?? '');
    education_level = TextEditingController(text: managerModel?.educationLevel ?? '');
    phone = TextEditingController(text: managerModel?.phone ?? '');
    role = TextEditingController(text: managerModel?.role ?? '');

    getAllMosquesForDropdown();
    super.onInit();
  }


  @override
  void dispose() {
    full_name.dispose();
    mother_name.dispose();
    birth_date.dispose();
    national_id.dispose();
    address.dispose();
    previous_job.dispose();
    education_level.dispose();
    phone.dispose();
    role.dispose();
    super.dispose();
  }
}