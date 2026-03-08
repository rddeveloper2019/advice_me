part of 'advice_list_cubit.dart';

class AdviceListState extends Equatable {
  const AdviceListState({
    required this.adviceList,
    required this.historyAdviceList,
    required this.isLoading,
  });

  final List<Advice> adviceList;
  final List<Advice> historyAdviceList;
  final bool isLoading;

  factory AdviceListState.initial() {
    return AdviceListState(
      adviceList: [],
      historyAdviceList: [],
      isLoading: false,
    );
  }

  @override
  List<Object> get props => [adviceList, historyAdviceList, isLoading];

  AdviceListState copyWith({
    List<Advice>? adviceList,
    List<Advice>? historyAdviceList,
    bool? isLoading,
  }) {
    return AdviceListState(
      adviceList: adviceList ?? this.adviceList,
      historyAdviceList: historyAdviceList ?? this.historyAdviceList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
