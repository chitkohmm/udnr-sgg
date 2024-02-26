part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class BorrowBookEvent extends BookEvent {
  final OrderRequestBody orderRequestBody;

  BorrowBookEvent({required this.orderRequestBody});
}

class DownloadBookEvent extends BookEvent {
  final AddBookToDownloadList addBookToDownloadList;

  DownloadBookEvent({required this.addBookToDownloadList});
}
