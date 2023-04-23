import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/language.dart';
import 'package:jdoodle/services/hive_statistics_service.dart';

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, Map<String, int>>(
  (ref) => StatisticsNotifier(),
);

class StatisticsNotifier extends StateNotifier<Map<String, int>> {
  StatisticsNotifier() : super({}) {
    init();
  }
  final statisticsService = HiveStatisticsService();

  Future<void> init() async {
    languageTimeMap = await statisticsService.getLanguageTimeMap();
  }

  set languageTimeMap(Map<String, int> map) => state = map;
  Map<String, int> get languageTimeMap => state;

  Future<void> addTimeToStats(JdoodleLanguage language, int seconds) async {
    statisticsService.addTimeToLanguageUsed(
      languageString: language.toString(),
      seconds: seconds,
    );
    state = await statisticsService.getLanguageTimeMap();
  }
}
