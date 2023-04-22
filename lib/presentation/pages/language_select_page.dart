import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/colors.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/language.dart';
import 'package:jdoodle/providers/code_editor_provider.dart';

class LanguageSelectPage extends ConsumerWidget {
  const LanguageSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void changeVersion(String? versionName) {
      if (versionName != null) {
        ref.read(codeProvider.notifier).setVersion(versionName);
      }
    }

    final currLanguage = ref.watch(codeProvider).language;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLanguageSearch(context, currLanguage),
            _buildVersionDropDown(currLanguage, changeVersion),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSearch(
    BuildContext context,
    JdoodleLanguage selectedLanguage,
  ) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Select Language:',
            style: TextStyles.header,
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/language-search',
            ),
            child: IntrinsicWidth(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedLanguage.name,
                        style: TextStyles.body,
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.grey.shade400,
                      )
                    ],
                  ),
                  const SizedBox(height: 3),
                  Container(height: 1, color: Colors.grey.shade400)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildVersionDropDown(
  JdoodleLanguage selectedLanguage,
  void Function(String?) changeVersion,
) {
  final dropdownItems = selectedLanguage.versions
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e,
            style: TextStyles.body,
          ),
        ),
      )
      .toList();

  return Column(
    children: [
      const Text(
        'Language version:',
        style: TextStyles.header,
      ),
      DropdownButton<String>(
        dropdownColor: AppColors.backgroundColor,
        value: selectedLanguage.version,
        onChanged: changeVersion,
        items: dropdownItems,
      ),
    ],
  );
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
    // Navigator.pushNamed(context, '/code-editor');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeLanguage,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(widget.language.name)],
        ),
      ),
    );
  }
}
