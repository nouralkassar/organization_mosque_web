import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/manager/manager_data.dart';
import '../../data/datasource/remote/mosque.dart';

abstract class DashboradController extends SearchMixController {
  GoToMosque();
  GoToaddMosque();
  GoToArchiveMosque();
  GoToAddManger();
  GoToManger();
  GoToArchiveManager();
  goToIssueDecision();
  goToRequest();
  goToComplaints();
  goToAddDuration();
}

class DashboradControllerImp extends DashboradController {
  void clearSearch() {
    search?.clear();
    isSearch = false;
    update();
  }

  @override
  GoToMosque() {
    Get.toNamed(AppRoute.Mosque);
  }

  @override
  goToIssueDecision() {
    Get.toNamed(AppRoute.issueDecision);
  }

  @override
  GoToArchiveMosque() {
    Get.toNamed(AppRoute.ArchiveDeleteMosque);
  }

  @override
  GoToAddManger() {
    Get.toNamed(AppRoute.AddMAnager);
  }
  @override
  GoToAddUser() {
    Get.toNamed(AppRoute.AddUser);
  }
  @override
  GoToManger() {
    Get.toNamed(
      AppRoute.Manager,
    );
  }

  @override
  GoToArchiveManager() {
    Get.toNamed(AppRoute.ArchiveDeleteManager);
  }

  @override
  GoToaddMosque() {
    Get.toNamed(AppRoute.AddMosque);
  }

  @override
  goToRequest() {
    Get.toNamed(AppRoute.Requset);
  }
  @override
  goToComplaints() {
    Get.toNamed(AppRoute.Complaints);
  }
  @override
  goToAddDuration() {
    Get.toNamed(AppRoute.addDuration);
  }
// myback(){
//   Get.offAllNamed(AppRoute.Dashboard);
// return Future.value(false);
// }
}

///////////////////////////////////////////
class SearchMixController extends GetxController {
  bool isSearch = false;
  StatusRequest statusRequest = StatusRequest.none;
  List<MosqueModel> listdata = [];
  MosqueData mosqueData = MosqueData(Get.find());
  // TextEditingController? search;
  TextEditingController? search = TextEditingController();
  String searchType = 'name';

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    } else {
      isSearch = true;
    }

    update();
  }

  setSearchTypeAndSearch(String type) {
    searchType = type;
    isSearch = true;
    searchData();
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    search?.dispose();
    super.onClose();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();

    final keyword = search!.text.trim();
    listdata.clear();

    Map<String, dynamic>? response;

    if (searchType == 'name') {
      response = await mosqueData.searchByName(keyword);
      print("📡 API المستخدم: searchByName");
    } else if (searchType == 'category') {
      response = await mosqueData.searchData(keyword);
      print("📡 API المستخدم: searchByCategory");
    }

    print("📥 Response: $response");

    if (response != null &&
        response is Map &&
        response['success'] == true &&
        response['data'] != null) {
      List dataList = response['data'];
      listdata.addAll(dataList.map((e) => MosqueModel.fromjson(e)));
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
