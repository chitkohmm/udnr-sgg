part of 'download_books_bloc.dart';

@immutable
abstract class DownloadBooksState {}

class DownloadBooksInitial extends DownloadBooksState {}

class DownloadBooksLoadingState extends DownloadBooksState {}

class DownloadBooksLoadedState extends DownloadBooksState {
  final DownloadBooks downloadBooks;
  DownloadBooksLoadedState({required this.downloadBooks});
}

class DownloadBooksErrorState extends DownloadBooksState {
  final int statusCode;
  DownloadBooksErrorState({required this.statusCode});
}
