import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 230,
        // width: MediaQuery.of(context).size.width * 0.2,
        margin: const EdgeInsets.only(top: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
          onPressed: onPressed,
          color: AppColor.bluish,
          textColor: AppColor.Begie, // ✅ لون واضح ومناسب للزر الداكن
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColor.Begie, // ✅ تأكيد على وضوح النص
              shadows: [
                Shadow(
                  offset: Offset(0.5, 0.5),
                  blurRadius: 2,
                  color: Colors.white10, // ✅ إضافة ظل خفيف للنص
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
