import 'package:organization_mosque_web/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth >= 900;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.teal[600],
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      leading: !isWideScreen
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            )
          : null,
      title: const AppBarTitle(),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth >= 900;

    return Row(
      children: [
        if (!isWideScreen) const SizedBox(width: 10),
        ClipOval(
          child: Image.asset(
            AppImageAsset.logo,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الجمهورية العربية السورية',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'وزارة الأوقاف',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}
