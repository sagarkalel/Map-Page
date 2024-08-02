import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_page/blocs/map_page_bloc/map_page_bloc.dart';
import 'package:map_page/utils/widget_extensions.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapPageBloc, MapPageState>(
      builder: (context, mapState) {
        final bloc = context.read<MapPageBloc>();
        if (mapState is MapPageLoaded) {
          return OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                bounds: LatLngBounds(
                  LatLng(
                      bloc.imageCoOrdinates[0].y, bloc.imageCoOrdinates[0].x),
                  LatLng(
                      bloc.imageCoOrdinates[1].y, bloc.imageCoOrdinates[1].x),
                ),
                imageProvider: MemoryImage(base64Decode(mapState.base64Image)),
              ),
            ],
          );
        } else if (mapState is MapPageError) {
          return Center(
              child: Text(
            mapState.error,
            textAlign: TextAlign.center,
          )).padXXDefault;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
