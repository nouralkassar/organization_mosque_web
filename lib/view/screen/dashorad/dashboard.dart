// import 'package:ecommaerce_course/core/class/handling_data_view.dart';
// import 'package:ecommaerce_course/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../controller/dashboard/dashboard.dart';
// import '../../../data/model/mosque_model.dart';
// import '../../widget/customappbar.dart';
// import '../../widget/dashboard/card_dash.dart';

// class Dashoard extends StatelessWidget {
//   const Dashoard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DashboradControllerImp controller = Get.put(DashboradControllerImp());
//     return GetBuilder<DashboradControllerImp>(
//       builder: (controller) {
//         return Scaffold(
//           body: Container(
//             child: ListView(children: [
//               CustomAppBar(
//                 titleappbar: "Find Product",
//                 onpressedSearch: () {
//                   controller.searchData();
//                 },
//                 mycontroller: controller.search!,
//                 onChanged: (val) {
//                   controller.checkSearch(val);
//                 },
//                 searchType: controller.searchType,
//                 onSearchTypeChanged: (val) {
//                   controller.setSearchTypeAndSearch(val);
//                 },
//               ),
//               SizedBox(height: 10),
//               handlingDataView(
//                 statusRequest: controller.statusRequest,
//                 widget: !controller.isSearch
//                     ? Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: CardDash(
//                                 onTap: controller.GoToMosque,
//                                 icon: Icon(Icons.mosque,
//                                     size: 50, color: AppColor.primaryColor),
//                                 text: "ادارة المساجد ",
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: CardDash(
//                                 onTap: controller.GoToArchiveMosque,
//                                 icon: Icon(Icons.delete,
//                                     size: 50, color: AppColor.red),
//                                 text: "ارشيف المساجد ",
//                               ),
//                             ),
//                             Expanded(
//                               child: CardDash(
//                                 onTap: controller.GoToAddUser,
//                                 icon: Icon(Icons.manage_accounts_rounded,
//                                     size: 50, color: AppColor.primaryColor),
//                                 text: "اضافة مستخدمين ",
//                               ),
//                             ),
//                             Expanded(
//                               child: CardDash(
//                                 onTap: controller.GoToManger,
//                                 icon: Icon(
//                                     Icons.supervised_user_circle_outlined,
//                                     size: 50,
//                                     color: AppColor.primaryColor),
//                                 text: "ادارة مدراء ",
//                               ),
//                             ),
//                             Expanded(
//                               child: CardDash(
//                                 onTap: controller.GoToArchiveManager,
//                                 icon: Icon(Icons.delete,
//                                     size: 50, color: AppColor.red),
//                                 text: "ارشيف المدراء ",
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ListItemsSearch(listdatamodel: controller.listdata),
//               )
//             ]),
//           ),
//         );
//       },
//     );
//   }
// }

// ////////////////////////////
// class ListItemsSearch extends GetView<DashboradControllerImp> {
//   final List<MosqueModel> listdatamodel;
//   const ListItemsSearch({super.key, required this.listdatamodel});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: listdatamodel.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               //  controller.goToPageProductDetails(listdatamodel[index]);
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 20),
//               child: Card(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child:
//                               Image.network(listdatamodel[index].image_path!)),
//                       Expanded(
//                           flex: 2,
//                           child: ListTile(
//                             title: Text(
//                               listdatamodel[index].name!,
//                             ),
//                             subtitle: Text(listdatamodel[index].details!),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
import 'package:organization_mosque_web/controller/dashboard/controller.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/view/screen/dashorad/dashboard_body.dart';
import 'package:organization_mosque_web/view/screen/dashorad/profileheder.dart';
import 'package:organization_mosque_web/view/screen/manager/archieve.dart';
import 'package:organization_mosque_web/view/screen/manager/view.dart';
import 'package:organization_mosque_web/view/screen/mosque/archive.dart';
import 'package:organization_mosque_web/view/screen/mosque/view.dart';
import 'package:organization_mosque_web/view/widget/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:organization_mosque_web/controller/dashboard/dashboard.dart';

import '../duration/view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<Dashboard> {
  DashboradControllerImp controller =
      Get.put(DashboradControllerImp(), permanent: true);

  IssueDecisionController controllerIm = Get.put(IssueDecisionController());

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardBody(),
    const ProfileHeader(),
    const AllMosque(),
    const AllManager(),
    const ArchiveDeleteManager(),
    const ArchiveDeleteMosque(),
    const ManagerDuration(),

    // باقي الواجهات
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    Dialogs.showConfirmationDialog(
      context: context,
      title: 'تأكيد تسجيل الخروج',
      content: 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      onConfirm: () {
        Get.offAllNamed('/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppColor.Begie.withOpacity(0.2),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.86,
              decoration: BoxDecoration(
                color: AppColor.Begie.withOpacity(0.4),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20), //
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 230,
                    decoration: BoxDecoration(
                      color: AppColor.bluish,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Divider(color: Colors.white54),
                        _buildNavItem(Icons.home, 'الرئيسية', 0),
                        _buildNavItem(Icons.person, 'الملف الشخصي', 1),
                        _buildNavItem(Icons.mosque, 'إدارة المساجد', 2),
                        _buildNavItem(
                            Icons.supervisor_account, 'إدارة المشرفين', 3),
                        _buildNavItem(Icons.archive, 'ارشفة مدير', 4),
                        _buildNavItem(Icons.archive, 'ارشفة مسجد', 5),
                        _buildNavItem(Icons.access_time, 'ادارة الدوام', 6),
                        // _buildNavItem(Icons.insert_chart, 'الإحصائيات', 7),

                        _buildNavItem(Icons.settings, 'الإعدادات', 7),
                        const Spacer(),
                        const Divider(color: Colors.white54),
                        ListTile(
                          leading:
                              const Icon(Icons.logout, color: Colors.white),
                          title: const Text('تسجيل الخروج',
                              style: TextStyle(color: Colors.white)),
                          onTap: () => _logout(context),
                        ),
                        const Divider(color: Colors.white54),
                      ],
                    ),
                    
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: IndexedStack(
                        index: _selectedIndex,
                        children: _pages,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: Color.fromARGB(255, 237, 220, 184)),
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 237, 220, 184)),
      ),
      onTap: index >= 0 ? () => _onItemTapped(index) : null,
    );
  }
}
