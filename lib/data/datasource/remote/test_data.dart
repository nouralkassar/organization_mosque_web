import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class TestData{

  Crud crud;

  TestData(this.crud);

  getData() async{
    var response =await crud.PostData(AppLink.test, {});

  return response.fold((l) => l, (r) => r);
  }

}