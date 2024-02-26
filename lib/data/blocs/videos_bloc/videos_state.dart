part of 'videos_bloc.dart';

@immutable
abstract class VideosState {}

class VideosInitial extends VideosState {}

class VideosLoadingState extends VideosState {}

class VideosLoadedState extends VideosState {
  final VideoResponse videoResponse;
  VideosLoadedState({required this.videoResponse});
}

class VideosErrorState extends VideosState {}
