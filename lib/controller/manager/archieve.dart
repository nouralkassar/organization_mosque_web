import 'package:organization_mosque_web/controller/manager/view.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/manager/manager_data.dart';
import 'package:organization_mosque_web/data/model/manager_model.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/mosque.dart';

abstract class ViewArchiveManagerController extends GetxController {
  GetArchivwMoanager();
}

class ViewArchiveManagerControllerImp extends ViewArchiveManagerController {
  StatusRequest statusRequest = StatusRequest.none;

  ManagerData managerData = ManagerData(Get.find());

  List<ManagerModel> data = [];

  @override
  GetArchivwMoanager() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await managerData.getArchive();
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ManagerModel.fromJson(e)));
        print("valid");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void restoreItem(int id) async {
    StatusRequest status = StatusRequest.loading;
    update();

    var response = await managerData.restore(id);
    if (response['success'] == true) {
      // 🔹 جيب المدير المستعاد من الـ API
      var restoredManager = ManagerModel.fromJson(response['data']);

      // 🔹 احذف من الأرشيف
      data.removeWhere((element) => element.id == id);
      statusRequest = StatusRequest.success;
      update();

      // 🔹 ضيف للـ AllManager Controller
      try {
        final allController = Get.find<ViewAllManagerControllerImp>();
        allController.data.add(restoredManager);
        allController.update();
      } catch (e) {
        print("AllManager controller not found: $e");
      }

      Get.snackbar("تم", "تمت استعادة المدير بنجاح");
    } else {
      Get.snackbar("خطأ", "فشل استعادة المدراء");
    }
  }


  @override
  void onInit() {
    GetArchivwMoanager();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.Manager);
    return Future.value(false);
  }
}
