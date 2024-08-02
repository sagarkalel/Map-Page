part of '../map_page.dart';

class MapPageView extends StatelessWidget {
  const MapPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Page')),
      body: BlocBuilder<MapPageBloc, MapPageState>(
        builder: (context, state) {
          final bloc = context.read<MapPageBloc>();
          if (state is MapPageLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          /// if no internet then return this
          if (state is NoInternetState) {
            return const Center(child: Text("No Internet!"));
          }

          /// else return this
          return FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                bloc.getInitialCenterCoOrdinatesForMap().y,
                bloc.getInitialCenterCoOrdinatesForMap().x,
              ),
              initialZoom: 16,
            ),
            children: [
              /// tile layer, to show map in background
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.map_page',
              ),

              /// image widget
              const ImageWidget(),

              /// polygon with given co-ordinates
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: bloc.polygonCoOrdinates
                        .map(
                          (e) => LatLng(e.y, e.x),
                        )
                        .toList(),
                    color: Colors.green.withOpacity(0.3),
                    borderColor: Colors.red,
                    borderStrokeWidth: 4,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
