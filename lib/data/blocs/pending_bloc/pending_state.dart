part of 'pending_bloc.dart';

@immutable
abstract class PendingState {}

class PendingInitial extends PendingState {}

class PendingLoadingState extends PendingState {}

class PendingLoadedState extends PendingState {
  final Pending pendingList;
  PendingLoadedState({required this.pendingList});
}

class PendingErrorState extends PendingState {}
