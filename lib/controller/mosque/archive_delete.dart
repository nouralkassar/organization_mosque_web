import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/mosque.dart';

abstract class ViewArchivwMosqueController extends GetxController {
  GetArchivwMosque();
}

class ViewArchiveMosqueControllerImp extends ViewArchivwMosqueController {
  StatusRequest statusRequest = StatusRequest.none;

  MosqueData mosqueData = MosqueData(Get.find());

  List<MosqueModel> data = [];

  @override
  GetArchivwMosque() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await mosqueData.getArchive();
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => MosqueModel.fromjson(e)));
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

    var response = await mosqueData.restore(id);
    if (response['success'] == true) {
      // حذف المسجد المستعاد من القائمة
      data.removeWhere((element) => element.id == id);
      statusRequest = StatusRequest.success;
      update();
    } else {
      Get.snackbar("خطأ", "فشل استعادة المسجد");
    }
  }

  @override
  void onInit() {
    GetArchivwMosque();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.Mosque);
    return Future.value(false);
  }
}
