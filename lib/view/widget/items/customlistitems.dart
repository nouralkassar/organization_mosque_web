//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/items_controller.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/functions/translateddatabase.dart';
// import '../../../data/model/itemsmodel.dart';
// import '../../../link_api.dart';
//
//
// class CustomListItems extends GetView<ItemsControllerImp> {
//   final ItemsModel itemsModel;
//
//   const CustomListItems( {super.key,
//
//     required this.itemsModel});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return InkWell(
//         onTap: (){
//           controller.goToPageProductDetails(itemsModel);
//         },
//         child: Card(
//
//           child:  Padding(
//             padding: const EdgeInsets.all(10.0),
//             child:
//             Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 SizedBox(height: 10,),
//                 Text(translateDatabase(itemsModel.name,itemsModel.name),
//                   style:  TextStyle(
//                       color: Colors.red ,
//                       fontSize:  50,
//                       fontWeight:  FontWeight.bold),),
//
//
//               ],),
//           ),
//         ));
//
//   }
// }