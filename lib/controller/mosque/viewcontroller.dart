import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/mosque.dart';
import 'archive_delete.dart';


abstract class ViewAllMosqueController extends GetxController {
  GetAllMosque();
  deleteMosque(int id );
  goPageEdit(MosqueModel mosqueModel);
  goToDetails(MosqueModel mosqueModel);
}

class ViewAllMosqueControllerImp extends ViewAllMosqueController {




  StatusRequest statusRequest=StatusRequest.none;

  MosqueData mosqueData = MosqueData(Get.find());

  List<MosqueModel> data = [];


  @override
  GetAllMosque() async {

    data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await mosqueData.get();
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
         List dataList =response['data'];
         data.addAll(dataList.map((e) => MosqueModel.fromjson(e)));
          print("valid");
        } else {
          Get.defaultDialog(
            title: 'warning',
            middleText: 'Phone number OR Email Already exists',
          );
          statusRequest = StatusRequest.failure;

        }
      }
      update();
    }




 // deleteMosque(int id) async {
   // var res = await mosqueData.delete(id);
   // if (res is! StatusRequest) {
   //   data.removeWhere((element) => element.id == id);
   //   update();
  //  } else {
  //    Get.snackbar("خطأ", "فشل في الحذف");
 //   }
 // }

  @override
  goPageEdit(MosqueModel mosqueModel){
    Get.toNamed(AppRoute.EditMosque,arguments: {
      'mosqueModel':mosqueModel
    });
  }
  deleteMosque(int id) async {
    var res = await mosqueData.delete(id);
    if (res is! StatusRequest) {
      data.removeWhere((element) => element.id == id);
      update();

      if (Get.isRegistered<ViewArchiveMosqueControllerImp>()) {
        Get.find<ViewArchiveMosqueControllerImp>().GetArchivwMosque();
      }

    } else {
      Get.snackbar("خطأ", "فشل في الحذف");
    }
  }

  @override
  goToDetails(mosqueModel) {
    Get.toNamed(AppRoute.detailMosque, arguments: {
      'mosque': mosqueModel
    });
  }


  @override
  void onInit() {
    GetAllMosque();
    super.onInit();
  }



  // myback(){
  //   Get.offAllNamed(AppRoute.Dashboard);
 // return Future.value(false);
  // }

}
