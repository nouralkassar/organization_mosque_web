import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:organization_mosque_web/core/constant/color.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final TextEditingController nameController =
      TextEditingController(text: 'أحمد محمد');
  final TextEditingController emailController =
      TextEditingController(text: 'ahmed@example.com');
  final TextEditingController passwordController =
      TextEditingController(text: '12345678');

  bool isEditing = false;
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Container(
          width: 750,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.bluish,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // صورة البروفايل
              const SizedBox(height: 20),

              // الحقول
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("المعلومات الشخصية:"),
                    const SizedBox(height: 20),
                    isEditing
                        ? _buildEditableField(nameController, 'الاسم')
                        : _buildStaticField('الاسم', nameController.text),
                    const SizedBox(height: 25),
                    isEditing
                        ? _buildEditableField(
                            emailController, 'البريد الإلكتروني')
                        : _buildStaticField(
                            'البريد الإلكتروني', emailController.text),
                    const SizedBox(height: 25),
                    isEditing
                        ? _buildEditableField(passwordController, 'كلمة المرور',
                            obscure: true)
                        : _buildStaticField('كلمة المرور',
                            '*' * passwordController.text.length),
                    const SizedBox(height: 35),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            if (isEditing) {
                              debugPrint('تم الحفظ:');
                              debugPrint('الاسم: ${nameController.text}');
                              debugPrint('البريد: ${emailController.text}');
                              debugPrint(
                                  'كلمة المرور: ${passwordController.text}');
                              debugPrint(
                                  'الصورة: ${_profileImage?.path ?? "لم تُعدّل"}');
                            }
                            isEditing = !isEditing;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColor.bluish,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: Icon(isEditing ? Icons.save : Icons.edit),
                        label: Text(
                          isEditing ? 'حفظ' : 'تعديل',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : const AssetImage('assets/profile.jpg')
                                    as ImageProvider,
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child:
                                Icon(Icons.edit, size: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(TextEditingController controller, String label,
      {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            filled: true,
            fillColor: Colors.white12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStaticField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
