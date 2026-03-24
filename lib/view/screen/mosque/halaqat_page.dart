import 'package:organization_mosque_web/view/widget/halaqa_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class HalaqatPage extends StatelessWidget {
  const HalaqatPage({super.key});

  final List<Map<String, String>> halaqatList = const [
    {
      "name": "حلقة ابن باز",
      "students": "15",
      "teacher": "الشيخ أحمد",
      "ageGroup": "10-12",
      "content": "تحفيظ جزء عم"
    },
    {
      "name": "حلقة ابن عثيمين",
      "students": "12",
      "teacher": "الشيخ خالد",
      "ageGroup": "13-15",
      "content": "تحفيظ جزء تبارك"
    },
    {
      "name": "حلقة النور",
      "students": "10",
      "teacher": "الشيخ محمود",
      "ageGroup": "7-9",
      "content": "تحفيظ قصار السور"
    },
    {
      "name": "حلقة الفرقان",
      "students": "9",
      "teacher": "الشيخ عبد الله",
      "ageGroup": "16-18",
      "content": "مراجعة الأجزاء"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final dynamic shiftData = Get.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Container(color: AppColor.Begie.withOpacity(0.2)),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (shiftData != null) ...[
                    Text(
                      shiftData['name'] ?? "اسم الدوام غير متوفر",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "تاريخ الدوام: ${shiftData['date'] ?? "غير محدد"}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  /// ✅ هذا هو التعديل المهم: استخدام Expanded لحجز المساحة المناسبة
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.Begie.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(30),
                        itemCount: halaqatList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 4,
                        ),
                        itemBuilder: (context, index) {
                          final halaqa = halaqatList[index];
                          return HalaqaCard(
                            name: halaqa["name"]!,
                            students: halaqa["students"]!,
                            teacher: halaqa["teacher"]!,
                            ageGroup: halaqa["ageGroup"]!,
                            content: halaqa["content"]!,
                          );
                        },
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
}
