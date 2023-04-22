import 'package:flutter/material.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ColoredBox(
        color: AppColors.greyMenuBackgroundColor,
        child: ListView(
          children: [
            Container(
              height: 200,
              width: 100,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/code-draw-logo.png',
                    height: 30,
                  ),
                  const Text(
                    'Code Drawer',
                    style: TextStyles.header,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                _DrawerMenuItem(
                  icon: languageIcon,
                  text: 'Change Language',
                  onTap: () => Navigator.pushNamed(context, '/language-select'),
                ),
                _DrawerMenuItem(
                  icon: statistics,
                  text: 'Statistics',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  const _DrawerMenuItem({
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final Icon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
            Text(
              text,
              style: TextStyles.body,
            )
          ],
        ),
      ),
    );
  }
}
