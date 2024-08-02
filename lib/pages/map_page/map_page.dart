import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_page/blocs/map_page_bloc/map_page_bloc.dart';
import 'package:map_page/pages/map_page/views/image_widget.dart';
import 'package:map_page/repositories/api_repositories.dart';

part 'views/map_page_view.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MapPageBloc(apiRepository: ApiRepository())..add(FetchImageData()),
      child: const MapPageView(),
    );
  }
}
