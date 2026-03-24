import 'package:organization_mosque_web/view/widget/statcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class ShiftDetailPage extends StatelessWidget {
  final dynamic shiftData; // بيانات الشفت

  const ShiftDetailPage({super.key, this.shiftData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // طبقة لون شفاف
          Positioned.fill(
            child: Container(color: AppColor.Begie.withOpacity(0.3)),
          ),

          // المحتوى الرئيسي
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.Begie.withOpacity(0.4),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // لتتناسب مع المحتوى فقط
                children: [
                  // // هنا نعرض معلومات الدوام
                  // if (shiftData != null) ...[
                  //   Text(
                  //     shiftData['name'] ?? "اسم الدوام غير متوفر",
                  //     style: const TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black87,
                  //     ),
                  //   ),
                  //   const SizedBox(height: 8),
                  //   Text(
                  //     "تاريخ الدوام: ${shiftData['date'] ?? "غير محدد"}",
                  //     style: const TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.black54,
                  //     ),
                  //   ),
                  //   const SizedBox(height: 16),
                  // ],

                  // الآن نعرض البطاقات كما كان
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatCard(
                        context,
                        title: "المشرفين القائمين",
                        count: "5",
                        icon: Icons.supervisor_account,
                        onTap: () {
                          Get.toNamed("/managersPage", arguments: shiftData);
                        },
                      ),
                      _buildStatCard(
                        context,
                        title: "حلقات تحفيظ",
                        count: "12",
                        icon: Icons.menu_book,
                        onTap: () {
                          Get.toNamed("/halaqatpage");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatCard(
                        context,
                        title: "دورات علمية",
                        count: "4",
                        icon: Icons.school,
                        onTap: () {
                          Get.toNamed("/coursesPage", arguments: shiftData);
                        },
                      ),
                      _buildStatCard(
                        context,
                        title: "المجازين",
                        count: "2",
                        icon: Icons.verified,
                        onTap: () {
                          Get.toNamed("/ijazatPage", arguments: shiftData);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context,
      {required String title,
      required String count,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: StatCard(
        title: title,
        count: count,
        icon: icon,
        color: AppColor.Begie,
      ),
    );
  }
}
