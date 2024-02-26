part of 'expired_books_bloc.dart';

@immutable
abstract class ExpiredBooksState {}

class ExpiredBooksInitial extends ExpiredBooksState {}

class ExpiredBooksLoadingState extends ExpiredBooksState {}

class ExpiredBooksLoadedState extends ExpiredBooksState {
  final ExpiredBooks downloadBooks;
  ExpiredBooksLoadedState({required this.downloadBooks});
}

class DownloadBooksErrorState extends ExpiredBooksState {}
