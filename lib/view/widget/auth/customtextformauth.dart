// import 'package:ecommaerce_course/core/constant/color.dart';
// import 'package:flutter/material.dart';

// class CustomTextFormAuth extends StatelessWidget {
//   final String hindtext;
//   final String labeltext;
//   final IconData iconData;
//   final TextEditingController mycontroller;
//   final String? Function(String?) valid;
//   final bool isNumber;
//   final bool? obscureText;
//   final void Function()? onTapIcon;
//   final OutlineInputBorder? border;
//   final VoidCallback? onTap;
//   final bool? readOnly;

//   const CustomTextFormAuth({
//     super.key,
//     this.obscureText,
//     this.onTapIcon,
//     required this.hindtext,
//     required this.labeltext,
//     required this.iconData,
//     required this.mycontroller,
//     required this.valid,
//     required this.isNumber,
//     this.border,
//     this.onTap,
//     this.readOnly,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 15),
//         width: MediaQuery.of(context).size.width * 0.4,
//         child: TextFormField(
//           controller: mycontroller,
//           validator: valid,
//           obscureText: obscureText ?? false,
//           keyboardType: isNumber
//               ? const TextInputType.numberWithOptions(decimal: true)
//               : TextInputType.text,
//           readOnly: readOnly ?? false,
//           onTap: onTap,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 16,
//             // fontFamily: 'Tajawal', // ← تغيير الخط هنا
//           ),
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: AppColor.Begie,
//             hintText: hindtext,
//             hintStyle: const TextStyle(
//               fontSize: 15,
//               color: AppColor.bluish,
//               // fontFamily: 'Tajawal',
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//             label: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 7),
//               child: Text(
//                 labeltext,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: AppColor.bluish,
//                   // fontFamily: 'Tajawal',
//                 ),
//               ),
//             ),
//             suffixIcon: onTapIcon == null
//                 ? Icon(iconData, color: AppColor.colorfonts)
//                 : InkWell(
//                     onTap: onTap,
//                     child: Icon(
//                       obscureText == true
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: AppColor.colorfonts,
//                     ),
//                   ),
//             border: border ??
//                 OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: const BorderSide(color: AppColor.bluish),
//                 ),
//             enabledBorder: border ??
//                 OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: const BorderSide(color: AppColor.bluish),
//                 ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: const BorderSide(
//                 color: Color.fromARGB(255, 149, 129, 84),
//                 width: 2.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hindtext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final OutlineInputBorder? border;
  final VoidCallback? onTap;
  final bool? readOnly;

  const CustomTextFormAuth({
    super.key,
    this.obscureText,
    this.onTapIcon,
    required this.hindtext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.border,
    this.onTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width * 0.52,
        child: TextFormField(
          controller: mycontroller,
          validator: valid,
          obscureText: obscureText ?? false,
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          readOnly: readOnly ?? false,
          onTap: onTap,
          style: const TextStyle(
            color: Color.fromARGB(255, 42, 41, 41),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.Begie,

            // ✅ النص الذي يطفو عند الضغط على الحقل
            labelText: null,

            // ✅ سلوك النص عند الضغط – يتحرك للأعلى
            floatingLabelBehavior: FloatingLabelBehavior.auto,

            // ✅ النص داخل الحقل بلون باهت
            hintText: hindtext,
            hintStyle: const TextStyle(
              fontSize: 15,
              color: AppColor.bluish,
            ),

            // ✅ المسافة بين النص والجهة اليمنى
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 30),

            suffixIcon: onTapIcon == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(iconData, color: AppColor.colorfonts),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      onTap: onTapIcon,
                      child: Icon(
                        obscureText == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.colorfonts,
                      ),
                    ),
                  ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColor.bluish),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColor.bluish),
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 149, 129, 84),
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
