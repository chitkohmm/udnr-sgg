part of 'book_bloc.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class BookLoadingState extends BookState {}

class BookLoadedState extends BookState {
  final OrderResponse orderResponse;
  final String status;
  BookLoadedState({
    required this.orderResponse,
    required this.status,
  });
}

class BookErrorState extends BookState {
  final int statusCode;
  BookErrorState({required this.statusCode});
}

class DownloadBookErrorState extends BookState {
  final int statusCode;
  DownloadBookErrorState({
    required this.statusCode,
  });
}
