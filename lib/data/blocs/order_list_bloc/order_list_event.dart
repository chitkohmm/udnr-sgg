part of 'order_list_bloc.dart';

@immutable
abstract class OrderListEvent {}

class GetOrderListEvent extends OrderListEvent {
  GetOrderListEvent();
}
