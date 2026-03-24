import 'package:organization_mosque_web/core/constant/routes.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:organization_mosque_web/data/model/duration.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/duration.dart';
import '../../data/datasource/remote/manager/manager_data.dart';
import '../../data/datasource/remote/mosque.dart';
import '../../data/model/manager_model.dart';
import '../../data/model/mosque_model.dart';
import '../mosque/viewcontroller.dart';


abstract class ViewDurationController extends GetxController {
  GetDuration();
  deleteDuration(int id );
  goPageEditDuration(DurationModel durationmodel);

}

class ViewDurationControllerImp extends ViewDurationController {




  StatusRequest statusRequest=StatusRequest.none;

  DurationtData durationData = DurationtData(Get.find());

  List<DurationModel> data = [];

  @override
  GetDuration() async {

    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await durationData.get();
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataList =response['data'];
        // 👇 أضف هذا هنا لطباعة كل عنصر قبل تحويله:
        for (var e in dataList) {
          print("🟡 Raw duration from API: $e");
        }
        data.addAll(dataList.map((e) => DurationModel.fromJson(e)));
        print("valid");
      } else {
        statusRequest = StatusRequest.failure;

      }
    }
    update();
  }




  deleteDuration(int id) async {
    var res = await durationData.delete(id);
    if (res is! StatusRequest) {
      data.removeWhere((element) => element.id == id);
      update();

      // // 🔹 جيب الكنترولر الخاص بالأرشيف وحدث بياناته مباشرة
      // try {
      //   final archiveController = Get.find<ViewArchiveManagerControllerImp>();
      //   archiveController.GetArchivwMoanager(); // إعادة جلب بيانات الأرشيف
      // } catch (e) {
      //   print("Archive controller not found: $e");
      // }

      // ممكن تضيف SnackBar للتأكيد
      Get.snackbar("تم", "تم الغاء الدوام");
    } else {
      Get.snackbar("خطأ", "فشل في الحذف");
    }
  }


  @override
  goPageEditDuration(DurationModel durationmodel) {
    print("📦 model before go to edit: ${durationmodel.toJson()}");

    Get.toNamed(AppRoute.EditDuration, arguments: {
      'durationmodel': durationmodel,

    });
  }


  @override
  void onInit() {
    GetDuration();
    super.onInit();
  }


// myback(){
//   Get.offAllNamed(AppRoute.Dashboard);
// return Future.value(false);
// }

}
