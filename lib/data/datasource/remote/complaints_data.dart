import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ComplaintsData {
  Crud crud;
  ComplaintsData(this.crud);



  Future<dynamic> getPreviousComplaints() async {
    var response = await crud.getData(AppLink.getComplaint);
    return response.fold((l) => l, (r) => r);
  }
  Future<dynamic> updateStatus(int id, String status) async {
    var response = await crud.PostDataWithToken("${AppLink.server}api/admin/complaints/$id", {
      "status": status,
    });
    return response.fold((l) => l, (r) => r);
  }



}