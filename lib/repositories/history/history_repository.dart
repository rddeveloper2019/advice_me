import 'dart:convert';

import 'package:advice_me/api/models/advice.dart';
import 'package:advice_me/repositories/history/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryRepository implements HistoryAdviceRepositoryInterface {
  static const String _key = 'history_advice_list';
  HistoryRepository({required this.prefs});
  final SharedPreferences prefs;
  @override
  Future<void> addAdvice(Advice advice) async {
    final list = await getAdviceList();
    list.add(advice);
    await saveAdviceList(list);
  }

  @override
  Future<void> clearAll() async {
    await prefs.remove(_key);
  }

  @override
  Future<List<Advice>> getAdviceList() async {
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return [];

    try {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((item) => Advice.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('❌ Error parsing Advice list: $e');
      return [];
    }
  }

  Future<void> saveAdviceList(List<Advice> advices) async {
    final jsonList = advices.map((a) => a.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }
}
