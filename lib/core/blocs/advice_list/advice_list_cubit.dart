import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advice_me/api/models/advice.dart';

part 'advice_list_state.dart';

class AdviceListCubit extends Cubit<AdviceListState> {
  AdviceListCubit() : super(AdviceListState(adviceList: []));

  void addAdvice(Advice advice) {
    emit(AdviceListState(adviceList: [...state.adviceList, advice]));
  }
}
