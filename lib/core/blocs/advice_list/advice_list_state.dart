part of 'advice_list_cubit.dart';

class AdviceListState extends Equatable {
  const AdviceListState({required this.adviceList});
  final List<Advice> adviceList;
  @override
  List<Object> get props => [adviceList];
}
