import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  static const List<Map<String, String>> coursesList = [
    {
      "name": "دورة التفسير",
      "time": "10:00 - 12:00",
      "content": "تفسير جزء عم",
      "teacher": "الشيخ أحمد",
      "image": "assets/images/course1.png",
    },
    {
      "name": "دورة الفقه",
      "time": "12:30 - 14:00",
      "content": "الفقه الحنفي",
      "teacher": "الشيخ خالد",
      "image": "assets/images/course2.png",
    },
    {
      "name": "دورة الحديث",
      "time": "14:30 - 16:00",
      "content": "شرح صحيح البخاري",
      "teacher": "الشيخ محمود",
      "image": "assets/images/course3.png",
    },
    {
      "name": "دورة السيرة",
      "time": "16:30 - 18:00",
      "content": "سيرة النبي ﷺ",
      "teacher": "الشيخ عبد الله",
      "image": "assets/images/course4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.Begie.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(30),
                        itemCount: coursesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 5,
                        ),
                        itemBuilder: (context, index) {
                          final course = coursesList[index];
                          return CourseCard(
                            name: course["name"]!,
                            time: course["time"]!,
                            teacher: course["teacher"]!,
                            content: course["content"]!,
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

class CourseCard extends StatelessWidget {
  final String name;
  final String time;
  final String teacher;
  final String content;

  const CourseCard({
    super.key,
    required this.name,
    required this.time,
    required this.teacher,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: AppColor.Begie.withOpacity(0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: const EdgeInsets.all(20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.25, // 👈 عرض أكبر
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "اسم الدورة:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(name,
                        style:
                            TextStyle(fontSize: 18, color: Colors.brown[700])),
                    const SizedBox(height: 16),
                    Text(
                      "الوقت:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(time,
                        style:
                            TextStyle(fontSize: 18, color: Colors.brown[700])),
                    const SizedBox(height: 16),
                    Text(
                      "المدرّس:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(teacher,
                        style:
                            TextStyle(fontSize: 18, color: Colors.brown[700])),
                    const SizedBox(height: 16),
                    Text(
                      "محتوى الدورة:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(content,
                        style:
                            TextStyle(fontSize: 18, color: Colors.brown[700])),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'إغلاق',
                  style: TextStyle(
                    color: AppColor.bluish,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: AppColor.Begie.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.bluish,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("الوقت: $time",
                      style: const TextStyle(
                          color: Color(0xff5c4033), fontSize: 16)),
                  Text("المدرس: $teacher",
                      style: const TextStyle(
                          color: Color(0xff5c4033), fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style:
                        const TextStyle(color: Color(0xff5c4033), fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
