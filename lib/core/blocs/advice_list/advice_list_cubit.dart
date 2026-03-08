import 'package:advice_me/repositories/history/history_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_me/api/models/advice.dart';

part 'advice_list_state.dart';

class AdviceListCubit extends Cubit<AdviceListState> {
  AdviceListCubit({required HistoryRepository historyRepository})
    : _historyRepository = historyRepository,
      super(AdviceListState.initial());

  final HistoryRepository _historyRepository;

  void addAdvice(Advice advice) {
    emit(
      state.copyWith(
        adviceList: [...state.adviceList, advice],
        historyAdviceList: [...state.historyAdviceList, advice],
        isLoading: false,
      ),
    );
    _historyRepository.addAdvice(advice);
  }

  Future<void> getHistoryAdvice() async {
    emit(state.copyWith(isLoading: true));
    final historyAdviceList = await _historyRepository.getAdviceList();
    emit(
      state.copyWith(historyAdviceList: historyAdviceList, isLoading: false),
    );
  }

  Future<void> clearHistoryAdvice() async {
    await _historyRepository.clearAll();
    emit(state.copyWith(historyAdviceList: []));
  }
}
