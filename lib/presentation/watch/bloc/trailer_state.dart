import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubeController;
  TrailerLoaded({required this.youtubeController});
}

class TrailerFailure extends TrailerState {
  final String errorMessage;
  TrailerFailure({required this.errorMessage});
}
