part of 'advice_list_cubit.dart';

class AdviceListState extends Equatable {
  const AdviceListState({required this.adviceList, required this.isLoading});

  final List<Advice> adviceList;

  final bool isLoading;

  factory AdviceListState.initial() {
    return AdviceListState(adviceList: [], isLoading: false);
  }

  @override
  List<Object> get props => [adviceList, isLoading];

  AdviceListState copyWith({List<Advice>? adviceList, bool? isLoading}) {
    return AdviceListState(
      adviceList: adviceList ?? this.adviceList,

      isLoading: isLoading ?? this.isLoading,
    );
  }
}
