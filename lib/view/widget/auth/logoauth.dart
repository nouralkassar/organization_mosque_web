import 'package:organization_mosque_web/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatefulWidget {
  const LogoAuth({super.key});

  @override
  State<LogoAuth> createState() => _LogoAuthState();
}

class _LogoAuthState extends State<LogoAuth>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  Offset _offset = const Offset(0, -0.2);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        _opacity = 1.0;
        _offset = Offset.zero;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _offset,
      duration: const Duration(milliseconds: 3000),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 3000),
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xfffac66f),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(
            child: Padding(
                padding: const EdgeInsets.all(10), // تضيف هامش داخلي حول الصورة
                child: Container(
                  width: 120, // حجم العرض
                  height: 120, // حجم الارتفاع
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImageAsset.logo),
                      fit: BoxFit.contain, // يحافظ على نسب الصورة داخل الدائرة
                      alignment: Alignment.center,
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
