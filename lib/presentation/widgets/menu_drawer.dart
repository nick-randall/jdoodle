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
              child: Center(
                child: Text(
                  'Compile Pilot',
                  style: TextStyles.header,
                ),
              ),
            ),
            Column(
              children: [
                _DrawerMenuItem(
                  icon: languageIcon,
                  text: 'Change Language',
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
  const _DrawerMenuItem({required this.text, required this.icon});
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
