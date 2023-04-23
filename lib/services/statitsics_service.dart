abstract class StatisticsService {
  void addTimeToLanguageUsed(
      {required String languageString, required int seconds});
  Future<Map<String, int>> getLanguageTimeMap();
}
