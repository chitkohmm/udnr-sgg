import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:libms_flutter/data/models/book/book_request_body.dart';
import 'package:libms_flutter/data/models/book/download_books.dart';
import 'package:libms_flutter/domain/storage_utils.dart';

import '../../network/api_service.dart';

part 'download_books_event.dart';
part 'download_books_state.dart';

class DownloadBooksBloc extends Bloc<DownloadBooksEvent, DownloadBooksState> {
  final ApiService apiService;
  DownloadBooksBloc({required this.apiService})
      : super(DownloadBooksInitial()) {
    on<GetDownloadBooksEvent>(_downloadBooks);
  }
  Future<void> _downloadBooks(GetDownloadBooksEvent event, Emitter emit) async {
    emit(DownloadBooksLoadingState());
    try {
      final response = await apiService.getDownloadBooks(
          "Bearer ${StorageUtils.getString("login_user")}",
          BookRequestBody(
              userId: int.parse(StorageUtils.getString("user_id"))));
      emit(DownloadBooksLoadedState(downloadBooks: response));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        emit(DownloadBooksErrorState(statusCode: e.response!.statusCode!));
      }
    }
  }
}
