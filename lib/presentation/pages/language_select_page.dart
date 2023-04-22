import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/languages.dart';
import 'package:jdoodle/language.dart';
import 'package:searchable_listview/searchable_listview.dart';

class LanguageSelectPage extends ConsumerWidget {
  const LanguageSelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SearchableList<JdoodleLanguage>(
          initialList: languages,
          builder: (e) => _ListItem(language: e),
          filter: (e) => languages
              .where((language) => language.name.toLowerCase().contains(e))
              .toList(),
          emptyWidget: Container(),
          inputDecoration: InputDecoration(
            labelText: 'Search for a language',
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // backgroundColor: Colors.black,
      ),
    );
  }
}

class _ListItem extends ConsumerWidget {
  const _ListItem({required this.language});
//  void _changeLanguage() {
//   final provider = ref
//  }

  final JdoodleLanguage language;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: ListTile(title: Text(language.name)),
    );
  }
}
