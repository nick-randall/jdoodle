import 'package:hive_flutter/hive_flutter.dart';
import 'package:jdoodle/constants/keys.dart';
import 'package:jdoodle/services/statitsics_service.dart';

class HiveStatisticsService extends StatisticsService {
  @override
  void addTimeToLanguageUsed({
    required String languageString,
    required int seconds,
  }) {
    final box = Hive.box<String>(statsBox);
    final existingSecondsString = box.get(languageString);
    var secondsToAdd;
    if (existingSecondsString != null) {
      secondsToAdd = int.parse(existingSecondsString) + seconds;
    } else {
      secondsToAdd = seconds;
    }
    box.put(languageString, secondsToAdd.toString());

    final justput = box.get(languageString);
    final all = box.values;
  }

  @override
  Future<Map<String, int>> getLanguageTimeMap() async {
    final box = Hive.box<String>(statsBox);
    final keys = box.keys.toList();
    final languageTimeMap = <String, int>{};
    for (final key in keys) {
      final value = box.get(key);
      if (key is String && value is String) {
        languageTimeMap[key] = int.parse(value);
      }
    }
    return languageTimeMap;
  }
}
