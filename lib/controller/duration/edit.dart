import 'package:organization_mosque_web/controller/duration/view.dart';
import 'package:organization_mosque_web/controller/manager/view.dart';
import 'package:organization_mosque_web/controller/mosque/viewcontroller.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/duration.dart';
import 'package:organization_mosque_web/data/datasource/remote/manager/manager_data.dart';
import 'package:organization_mosque_web/data/model/duration.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/mosque.dart';
import '../../data/model/manager_model.dart';
import 'package:collection/collection.dart'; // ضروري

abstract class EditDurationController extends GetxController {
  EditDuration();
}

class EditDurationControllerImp extends EditDurationController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

DurationModel? durationModel;
  late TextEditingController name;
  late TextEditingController type;
  late TextEditingController daysOfWeek;
  late TextEditingController start_time;
  late TextEditingController end_time;
  List<MosqueModel> mosqueList = [];
  List<ManagerModel> managersList = [];
  // MosqueModel? mosqueModel;
  // ManagerModel? managerModel;
  StatusRequest statusRequest = StatusRequest.none;

  DurationtData durationtData = DurationtData(Get.find());

  String? selectedMosqueId ;
  String? selectedManagerId ;
  @override

  EditDuration() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      String selectedId1 = selectedMosqueId ?? durationModel!.mosqueId.toString();
      String selectedId2 = selectedManagerId ?? durationModel!.staffId.toString();



      // ✅ إعداد البيانات للإرسال
      Map data = {
       // "mosque_id": selectedMosqueId.toString(),
       // "staff_id": selectedManagerId.toString(),
        "name": name.text,
        "type": type.text,
        "daysOfWeek": daysOfWeek.text,
        "start_time": start_time.text,
        "end_time": end_time.text,
        "mosque_id":selectedId1,
        "staff_id":selectedId2,
        // "mosque_name": selectedMosqueName, // ✅ تمت إضافته هنا
      };

      var response = await durationtData.edit(data, durationModel!.id.toString());
      print("================== Duartion Edit Response: $response");

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['success'] == true) {
          Get.offAllNamed(AppRoute.Dashboard);
          ViewDurationControllerImp c = Get.find();
          c.GetDuration();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      print("❌ Form is not valid");
    }
  }


  @override
  void onInit() {
    durationModel = Get.arguments['durationmodel'];
    print("🔥 durationModel from arguments: ${durationModel?.toJson()}");
    name = TextEditingController(text: durationModel?.name ?? '');
    type = TextEditingController(text: durationModel?.type ?? '');
    daysOfWeek = TextEditingController(text: durationModel?.daysOfWeek ?? '');
    start_time = TextEditingController(text: durationModel?.startTime ?? '');
    end_time = TextEditingController(text: durationModel?.endTime ?? '');


    getAllMosquesForDropdown();
    getAllManagerForDropdown();
    super.onInit();
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

      if (durationModel?.mosqueId != null) {
        final exists = mosqueList.any((m) => m.id.toString() == durationModel!.mosqueId.toString());
        if (exists) {
          selectedMosqueId = durationModel!.mosqueId.toString();
          print("🎯 Selected mosqueId = $selectedMosqueId");
        }
      }

      update(); // هذا لازم يخلّي الـ Dropdown يظهر
    } else {
      Get.snackbar("خطأ", "فشل تحميل المساجد");
    }
  }
  void getAllManagerForDropdown() async {
    print("🚀 بدي جيب المشرفين ...");

    var response = await ManagerData(Get.find()).get();
    print("📥 Response: $response");

    if (response is! StatusRequest) {
      managersList = (response['data'] as List)
          .map((e) => ManagerModel.fromJson(e))
          .toList();

      print("✅ عدد المشرفين بعد التحويل: ${managersList.length}");
      for (var manger in managersList) {
        print("🕌 Mosque: ${manger.id} - ${manger.full_name}");
      }

      if (durationModel?.staffId != null) {
        final exists = managersList.any((m) => m.id.toString() == durationModel!.staffId.toString());
        if (exists) {
          selectedManagerId = durationModel!.staffId.toString();
          print("🎯 Selected staffId = $selectedManagerId");
        }
      }

      update(); // هذا لازم يخلّي الـ Dropdown يظهر
    } else {
      Get.snackbar("خطأ", "فشل تحميل المشرفين");
    }
  }
  @override
  void dispose() {
    name.dispose();
    type.dispose();
    daysOfWeek.dispose();
    start_time.dispose();
    end_time.dispose();
    super.dispose();
  }
}