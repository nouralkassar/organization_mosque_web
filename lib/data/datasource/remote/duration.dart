import 'package:organization_mosque_web/view/screen/duration/add.dart';

import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class DurationtData {
  Crud crud;
  DurationtData(this.crud);



  Future<dynamic> AddDuration(Map data) async {
    var response = await crud.PostDataWithToken(AppLink.AddDuration,data);
    return response.fold((l) => l, (r) => r);
  }
  get() async {
    var response = await crud.getData(AppLink.ViewDuration);

    return response.fold((l) => l, (r) => r);
  }

  edit(Map data,String id) async {
    String urlWithId = "${AppLink.editDuration}/$id";

    var response =await crud.PostDataWithToken(urlWithId,data);
    return response.fold((l) => l, (r) => r);
  }

  delete(int id) async {
    var response = await crud.DeleteData("${AppLink.deletDuration}/$id");

    return response.fold((l) => l, (r) => r);
  }
}