import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/languages.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/language.dart';
import 'package:jdoodle/providers/code_editor_provider.dart';
import 'package:searchable_listview/searchable_listview.dart';

class LanguageSearch extends ConsumerStatefulWidget {
  const LanguageSearch({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LanguageSearchState();
}

class _LanguageSearchState extends ConsumerState<LanguageSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarRow(),
      backgroundColor: AppColors.backgroundColor,
      body: SearchableList<JdoodleLanguage>(
        initialList: languages,
        builder: (e) => _ListItem(language: e),
        filter: (searchParam) => languages
            .where(
              (language) => language.name
                  .toLowerCase()
                  .contains(searchParam.toLowerCase()),
            )
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
    );
  }

  PreferredSizeWidget _buildAppBarRow() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Select language',
            style: TextStyles.header,
          )
        ],
      ),
    );

    // leading: Text('run'),
    // backgroundColor: Colors.black,
  }
}

class _ListItem extends ConsumerStatefulWidget {
  const _ListItem({required this.language});
  final JdoodleLanguage language;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListItemState();
}

class _ListItemState extends ConsumerState<_ListItem> {
  void _changeLanguage() {
    ref.read(codeProvider.notifier).language = widget.language;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeLanguage,
      child: ListTile(title: Text(widget.language.name)),
    );
  }
}
