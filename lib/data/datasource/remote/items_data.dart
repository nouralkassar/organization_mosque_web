
import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ItemsData{

  Crud crud;

  ItemsData(this.crud);

  getData( ) async{
    var response =await crud.getData(AppLink.allmosque);

    return response.fold((l) => l, (r) => r);
  }

}