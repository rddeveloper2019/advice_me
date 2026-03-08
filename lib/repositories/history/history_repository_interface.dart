import 'package:advice_me/api/models/advice.dart';

abstract interface class HistoryAdviceRepositoryInterface {
  Future<List<Advice>> getAdviceList();
  Future<void> addAdvice(Advice advice);
  Future<void> clearAll();
}
