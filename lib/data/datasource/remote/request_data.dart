import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class RequestData {
  Crud crud;
  RequestData(this.crud);



  Future<dynamic> getPreviousRequests() async {
    var response = await crud.getData(AppLink.getRequest);
    return response.fold((l) => l, (r) => r);
  }
  Future<dynamic> updateStatus(int id, String status) async {
    var response = await crud.PostDataWithToken("${AppLink.server}api/admin/admin/requests/$id/status", {
      "status": status,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> updateProgress(int id, String progress) async {
    var response = await crud.PostDataWithToken("${AppLink.server}api/admin/admin/requests/$id/progress", {
      "progress": progress,
    });
    return response.fold((l) => l, (r) => r);
  }

}