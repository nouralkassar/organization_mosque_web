import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class AddUserData{

  Crud crud;

  AddUserData(this.crud);

  postData(String full_name,
      String email,
      String password,
      String password_confirmation,
      String mother_name,
      String old,
      String mynumber,
      String addess,
      String ago_work,
      String studing,) async{
    var response =await crud.PostData(AppLink.adduser, {
      "full_name" :full_name ,
      "email" : email,
      "password" : password,
      "password_confirmation" : password_confirmation,
      "mother_name" : mother_name,
      "password" : password,
      "old" : old,
      "mynumber" : mynumber,
      "addess" : addess,
      "ago_work" : ago_work,
      "studing" : studing,

    });

    return response.fold((l) => l, (r) => r);
  }

}