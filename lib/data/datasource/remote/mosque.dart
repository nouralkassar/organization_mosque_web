import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class MosqueData {
  Crud crud;

  MosqueData(this.crud);

  get() async {
    var response = await crud.getData(AppLink.allmosque);

    return response.fold((l) => l, (r) => r);
  }

  getArchive() async {
    var response = await crud.getData(AppLink.archiveMosque);

    return response.fold((l) => l, (r) => r);
  }

  add(Map data, dynamic file) async {
    var response = await crud.addRequestWithImageOne(
      AppLink.addmosque,
      data,
      file,
    );

    return response.fold((l) => l, (r) => r);
  }

  delete(int id) async {
    var response = await crud.DeleteData("${AppLink.deletmosque}/$id");

    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [dynamic file]) async {
    String urlWithId = "${AppLink.editmosque}/${data['id']}";

    var response;
    if (file == null) {
      response = await crud.PostDataWithToken(urlWithId, data);
    } else {
      response = await crud.addRequestWithImageOne(urlWithId, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  searchData(String category) async {
    var response = await crud.PostDataWithToken(
        AppLink.searchByCategory, {"category": category});

    return response.fold((l) => l, (r) => r);
  }

  searchByName(String name) async {
    var response = await crud.PostDataWithToken(AppLink.searchByName, {
      "name": name,
    });
    return response.fold((l) => l, (r) => r);
  }

  restore(int id) async {
    var response =
        await crud.PostDataWithToken("${AppLink.restorearchive}/$id", {});
    return response.fold((l) => l, (r) => r);
  }

  getArchivedStaff(int id) async {
    String urlWithId = "${AppLink.restorearchive}/$id";
    var response = await crud.PostDataWithToken(urlWithId, {});
    return response.fold((l) => l, (r) => r);
  }
}
