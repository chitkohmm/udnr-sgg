import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/storage_utils.dart';
import '../../models/video/video_response.dart';
import '../../network/api_service.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final ApiService apiService;
  VideosBloc({required this.apiService}) : super(VideosInitial()) {
    on<GetVideosEvent>(_onEvent);
  }

  Future<void> _onEvent(GetVideosEvent event, Emitter emit) async {
    emit(VideosLoadingState());
    try {

      debugPrint('SCI : ${StorageUtils.getString("sci")}');

      final response = await apiService.getVideos(
          "Bearer ${StorageUtils.getString("login_user")}",
          StorageUtils.getString("sci"));
      emit(VideosLoadedState(videoResponse: response));

      /// network call
    } on DioError catch (_) {
      emit(VideosErrorState());
    }
  }
}
