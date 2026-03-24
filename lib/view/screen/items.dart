//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/items_controller.dart';
// import '../../core/class/handling_data_view.dart';
// import '../../data/model/itemsmodel.dart';
// import '../widget/customappbar.dart';
// import '../widget/items/customlistitems.dart';
//
//
// class Items extends StatelessWidget {
//   const Items({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ItemsControllerImp());
//
//     return Scaffold(
//
//       body: Container(
//         padding:  const EdgeInsets.all(15),
//         child:ListView(children: [
//
//           CustomAppBar(
//             titleappbar: "Find Product",
//             onPressedIcon: (){},
//             onpressedSearch: (){},),
//           const SizedBox(height: 20,),
//
//           GetBuilder<ItemsControllerImp>(
//               builder: (controller) => handlingDataRequest(
//                   statusRequest : controller.statusRequest,
//                   widget:
//                   GridView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: controller.data.length,
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
//                       itemBuilder: (BuildContext context , index) {
//                         return CustomListItems(itemsModel: ItemsModel.fromjson(controller.data[index])
//                           //, active: true,
//                         );
//                       })))
//         ],),
//
//       ),
//     );
//   }
// }