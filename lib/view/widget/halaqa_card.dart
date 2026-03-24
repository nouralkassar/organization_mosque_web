import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class HalaqaCard extends StatelessWidget {
  final String name;
  final String students;
  final String teacher;
  final String ageGroup;
  final String content;
  final VoidCallback? onTap;

  const HalaqaCard({
    super.key,
    required this.name,
    required this.students,
    required this.teacher,
    required this.ageGroup,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.Begie.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اسم الحلقة
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.bluish),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              _buildInfoRow(Icons.group, "الطلاب: $students"),
              const SizedBox(height: 4),

              _buildInfoRow(Icons.person, "المعلم: $teacher"),
              const SizedBox(height: 4),

              _buildInfoRow(Icons.cake, "العمر: $ageGroup"),
              const SizedBox(height: 4),

              _buildInfoRow(Icons.book, "المحتوى: $content", multiline: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {bool multiline = false}) {
    return Row(
      crossAxisAlignment:
          multiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: AppColor.bluish),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff5c4033),
            ),
            maxLines: multiline ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
