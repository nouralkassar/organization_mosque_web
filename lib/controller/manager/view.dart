import 'package:organization_mosque_web/core/constant/routes.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/manager/manager_data.dart';
import '../../data/datasource/remote/mosque.dart';
import '../../data/model/manager_model.dart';
import '../../data/model/mosque_model.dart';
import '../mosque/viewcontroller.dart';
import 'archieve.dart';


abstract class ViewAllManagerController extends GetxController {
  GetAllManager();
  deleteManager(int id );
  goPageEditManager(ManagerModel managerModel);

}

class ViewAllManagerControllerImp extends ViewAllManagerController {




  StatusRequest statusRequest=StatusRequest.none;

  ManagerData managerData = ManagerData(Get.find());

  List<ManagerModel> data = [];


  @override
  GetAllManager() async {

    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await managerData.get();
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataList =response['data'];
        // 👇 أضف هذا هنا لطباعة كل عنصر قبل تحويله:
        for (var e in dataList) {
          print("🟡 Raw manager from API: $e");
        }
        data.addAll(dataList.map((e) => ManagerModel.fromJson(e)));
        print("valid");
      } else {
        statusRequest = StatusRequest.failure;

      }
    }
    update();
  }




  deleteManager(int id) async {
    var res = await managerData.delete(id);
    if (res is! StatusRequest) {
      // 🔹 احذف من قائمة المدراء الحاليين
      data.removeWhere((element) => element.id == id);
      update();

      // 🔹 جيب الكنترولر الخاص بالأرشيف وحدث بياناته مباشرة
      try {
        final archiveController = Get.find<ViewArchiveManagerControllerImp>();
        archiveController.GetArchivwMoanager(); // إعادة جلب بيانات الأرشيف
      } catch (e) {
        print("Archive controller not found: $e");
      }

      // ممكن تضيف SnackBar للتأكيد
      Get.snackbar("تم", "تم نقل المدير إلى الأرشيف");
    } else {
      Get.snackbar("خطأ", "فشل في الحذف");
    }
  }


  @override
  goPageEditManager(ManagerModel managerModel) {
    print("📦 model before go to edit: ${managerModel.toJson()}");

    Get.toNamed(AppRoute.EditManager, arguments: {
      'managerModel': managerModel,

    });
  }


  @override
  void onInit() {
    GetAllManager();
    super.onInit();
  }


// myback(){
//   Get.offAllNamed(AppRoute.Dashboard);
// return Future.value(false);
// }

}
