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
        adviceList: [
          advice,
          ...state.adviceList.where((a) => a.id != advice.id),
        ],

        isLoading: false,
      ),
    );
    _historyRepository.addAdvice(advice);
  }

  Future<void> getHistoryAdvice() async {
    emit(state.copyWith(isLoading: true));
    final adviceList = await _historyRepository.getAdviceList();
    emit(state.copyWith(adviceList: adviceList, isLoading: false));
  }

  Future<void> updateAdvice(Advice advice) async {
    emit(state.copyWith(isLoading: true));
    final adviceList = await _historyRepository.getAdviceList();
    final historyIndex = adviceList.indexWhere((item) => item.id == advice.id);
    if (historyIndex != -1) {
      adviceList[historyIndex] = advice;
      await _historyRepository.updateAdviceList(adviceList);
    }

    emit(state.copyWith(adviceList: adviceList, isLoading: false));
  }

  Future<void> deleteAdvice(Advice advice) async {
    emit(state.copyWith(isLoading: true));
    final adviceList = await _historyRepository.getAdviceList();
    final updatedAdviceList = adviceList
        .where((item) => item.id != advice.id)
        .toList();

    await _historyRepository.updateAdviceList(updatedAdviceList);
    emit(state.copyWith(adviceList: updatedAdviceList, isLoading: false));
  }

  Future<void> clearHistoryAdvice() async {
    await _historyRepository.clearAll();
    emit(state.copyWith(adviceList: []));
  }
}
