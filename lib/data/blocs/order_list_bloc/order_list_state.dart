part of 'order_list_bloc.dart';

@immutable
abstract class OrderListState {}

class OrderListInitial extends OrderListState {}

class OrderListLoadingState extends OrderListState {}

class OrderListLoadedState extends OrderListState {
  final OrderListEntity orderListResponse;
  OrderListLoadedState({required this.orderListResponse});
}

class OrderListErrorState extends OrderListState {}
