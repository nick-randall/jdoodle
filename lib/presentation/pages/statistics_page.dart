import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/presentation/widgets/standard_app_bar.dart';
import 'package:jdoodle/providers/language_provider.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSecondsMap = ref.watch(statisticsProvider);
    return Scaffold(
      appBar: buildStandardAppBar(title: 'Usage Statistics'),
      // backgroundColor: AppColors.backgroundColor,
      body: Container(
        color: Colors.redAccent,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: languageSecondsMap.keys
              .map(
                (key) => Text(
                  '$key: ${getTime(languageSecondsMap[key] ?? 1)}',
                  style: TextStyles.body,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  String getTime(int seconds) {
    if (seconds > 3599) return '${(seconds / 3600).floor()} hours';
    if (seconds > 59) return '${(seconds / 60).floor()} minutes';
    return '$seconds seconds';
  }
}
