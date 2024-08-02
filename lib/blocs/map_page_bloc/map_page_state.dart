part of 'map_page_bloc.dart';

abstract class MapPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapPageInitial extends MapPageState {}

class NoInternetState extends MapPageState {}

class MapPageLoading extends MapPageState {}

class MapPageLoaded extends MapPageState {
  final String base64Image;

  MapPageLoaded(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}

class MapPageError extends MapPageState {
  final String error;

  MapPageError(this.error);

  @override
  List<Object?> get props => [error];
}
