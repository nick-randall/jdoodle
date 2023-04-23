import 'package:flutter/material.dart';
import 'package:jdoodle/constants/text_styles.dart';

PreferredSizeWidget buildStandardAppBar({required String title}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.header,
        )
      ],
    ),
  );
}
