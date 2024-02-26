import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/storage_utils.dart';
import '../../models/book/add_book_to_download_list.dart';
import '../../models/order/order_request_body.dart';
import '../../models/order/order_response.dart';
import '../../network/api_service.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final ApiService apiService;
  BookBloc({required this.apiService}) : super(BookInitial()) {
    on<BorrowBookEvent>(_borrowBooks);
    on<DownloadBookEvent>(_downloadBooks);
  }
  Future<void> _borrowBooks(BorrowBookEvent event, Emitter emit) async {
    emit(BookLoadingState());
    try {
      final response = await apiService.orderBooks(
          "Bearer ${StorageUtils.getString("login_user")}",
          event.orderRequestBody);
      emit(BookLoadedState(orderResponse: response, status: '1'));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(BookErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }

  Future<void> _downloadBooks(DownloadBookEvent event, Emitter emit) async {
    emit(BookLoadingState());
    try {
      final response = await apiService.downloadBook(
          "Bearer ${StorageUtils.getString("login_user")}",
          event.addBookToDownloadList);
      emit(BookLoadedState(orderResponse: response, status: '0'));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(DownloadBookErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }
}
