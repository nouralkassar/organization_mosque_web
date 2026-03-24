// import 'package:flutter/material.dart';

// class StatCard extends StatelessWidget {
//   final String title;
//   final String count;

//   const StatCard({super.key, required this.title, required this.count});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.teal.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(count,
//               style:
//                   const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           Text(title, textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.count,
    this.icon = Icons.bar_chart,
    this.color = const Color.fromARGB(255, 229, 206, 158),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230, // أوسع ليتناسب مع شاشة الويب
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(2, 6),
          )
        ],
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.bluish,
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.bluish),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5c4033),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
