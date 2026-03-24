import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class SignupData{

  Crud crud;

  SignupData(this.crud);

  postData(String username,String password,String email,String phone) async{
    var response =await crud.PostData(AppLink.signup, {
      "username" :username ,
      "password" : password,
      "email" : email,
      "phone" : phone,


    });

    return response.fold((l) => l, (r) => r);
  }

}