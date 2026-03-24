import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class ManagerData {
  Crud crud;

  ManagerData(this.crud);

  Future postData({
    required String fullName,
    required String motherName,
    required String birthDate,
    required String nationalId,
    required String address,
    required String previousJob,
    required String educationLevel,
    required String phone,
    required String role,
    required String mosqueId,
  }) async {
    var response = await crud.PostDataWithToken(AppLink.addmanager, {
      "full_name": fullName,
      "mother_name": motherName,
      "birth_date": birthDate,
      "national_id": nationalId,
      "address": address,
      "previous_job": previousJob,
      "education_level": educationLevel,
      "phone": phone,
      "role":role,
      "mosque_id": mosqueId,
    });

    return response.fold((l) => l, (r) => r);
  }
  edit(Map data,String id) async {
    String urlWithId = "${AppLink.editmanager}/$id";

    var response =await crud.PostDataWithToken(urlWithId,data);
    return response.fold((l) => l, (r) => r);
  }
  get() async {
    var response = await crud.getData(AppLink.allmanager);

    return response.fold((l) => l, (r) => r);
  }
  getArchive() async {
    var response = await crud.getData(AppLink.archiveManager);

    return response.fold((l) => l, (r) => r);
  }
  delete(int id) async {
    var response = await crud.DeleteData("${AppLink.deletmanager}/$id");

    return response.fold((l) => l, (r) => r);
  }
  restore(int id) async {
    var response = await crud.PostDataWithToken("${AppLink.restorearchive}/$id", {});
    return response.fold((l) => l, (r) => r);
  }
}
