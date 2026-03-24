// import 'dart:io';
//
// import 'package:ecommaerce_course/core/class/crud.dart';
// import 'package:ecommaerce_course/link_api.dart';
//
// class AddMosqueData{
//
//   Crud crud;
//
//   AddMosqueData(this.crud);
//
//   PostDataWithToken(String name,
//       String address,
//       String area,
//       String details,
//       String technical_status,
//       String category,
//       bool has_female_section,
//       File imageFile,
//
//       /// String image_path,
//      ) async{
//     var response =await crud.PostDataWithToken(AppLink.addmosque, {
//       "name" :name ,
//       "address" : address,
//       "area" : area,
//       "details" : details,
//       "technical_status" : technical_status,
//       "category" : category,
//       "has_female_section" : has_female_section,
//       //"image_path" : image_path,
//
//     },imageFile,
//     );
//
//     return response.fold((l) => l, (r) => r);
//   }
//
// }