import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:map_page/models/co_ordinates_model.dart';
import 'package:map_page/repositories/api_repositories.dart';

part 'map_page_event.dart';
part 'map_page_state.dart';

class MapPageBloc extends Bloc<MapPageEvent, MapPageState> {
  MapPageBloc({required this.apiRepository}) : super(MapPageInitial()) {
    on<FetchImageData>(_fetchImageData);
  }

  final ApiRepository apiRepository;

  /// provided in assignment
  final List<CoOrdinatesModel> imageCoOrdinates = const [
    CoOrdinatesModel(x: 75.89927315711975, y: 17.696488452163646),
    CoOrdinatesModel(x: 75.9005770459771, y: 17.698112010420576),
  ];

  /// provided in assignment
  final List<CoOrdinatesModel> polygonCoOrdinates = const [
    CoOrdinatesModel(x: 75.899273157, y: 17.697995426),
    CoOrdinatesModel(x: 75.900360458, y: 17.69811201),
    CoOrdinatesModel(x: 75.900577046, y: 17.696535086),
    CoOrdinatesModel(x: 75.899297632, y: 17.696488452),
    CoOrdinatesModel(x: 75.899273157, y: 17.697995426),
  ];

  /// fetch image data
  Future<void> _fetchImageData(
      MapPageEvent event, Emitter<MapPageState> emit) async {
    emit(MapPageLoading());
    try {
      final hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        final imageData = await apiRepository.fetchImageData();
        emit(MapPageLoaded(imageData));
      } else {
        emit(NoInternetState());
      }
    } catch (e, s) {
      log("Error while loading image data: $e", stackTrace: s);
      emit(MapPageError(e.toString()));
    }
  }

  CoOrdinatesModel getInitialCenterCoOrdinatesForMap() {
    /// taking average of image co-ordinates as initial center of map
    final double x = (imageCoOrdinates[0].x + imageCoOrdinates[1].x) / 2;
    final double y = (imageCoOrdinates[0].y + imageCoOrdinates[1].y) / 2;
    return CoOrdinatesModel(x: x, y: y);
  }
}
