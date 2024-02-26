import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/storage_utils.dart';
import '../../models/book/book_request_body.dart';
import '../../models/pending/pending.dart';
import '../../network/api_service.dart';

part 'pending_event.dart';
part 'pending_state.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  final ApiService apiService;
  PendingBloc({required this.apiService}) : super(PendingInitial()) {
    on<GetPendingBooksEvent>(_pendingEvent);
  }

  Future<void> _pendingEvent(GetPendingBooksEvent event, Emitter emit) async {
    emit(PendingLoadingState());
    try {
      final response = await apiService.getPendingBooks(
          "Bearer ${StorageUtils.getString("login_user")}",
          BookRequestBody(
              userId: int.parse(StorageUtils.getString("user_id"))));
      emit(PendingLoadedState(pendingList: response));
    } on DioError catch (_) {
      PendingErrorState();
    }
  }
}
