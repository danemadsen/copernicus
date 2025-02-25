import 'package:copernicus/copernicus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

void main() {
  runApp(const CopernicusExampleApp());
}

class CopernicusExampleApp extends StatelessWidget {
  const CopernicusExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Copernicus Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String clientId = 'YOUR_CLIENT_ID';
  String clientSecret = 'YOUR_CLIENT_SECRET';

  @override
  Widget build(BuildContext context) {
    final mapOptions = MapOptions(
      initialCenter: const LatLng(-27.47, 153.02),
      initialZoom: 10,
      cameraConstraint: CameraConstraint.contain(
        bounds: LatLngBounds(
          const LatLng(-90, -180),
          const LatLng(90, 180),
        ),
      )
    );

    return FlutterMap(
      options: mapOptions,
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.copernicus',
          tileProvider: CancellableNetworkTileProvider(),
        ),
        CopernicusLayer(
          clientId: clientId, 
          clientSecret: clientSecret, 
          data: const [
            CopernicusRequestData(
              satillite: Satillite.s2l2a, 
              filteringOptions: FilteringOptions(
                mosaickingOrder: MosaickingOrder.mostRecent,
                maxCloudCoverage: 100,
              ),
              processingOptions: ProcessingOptions(
                downSampling: Sampling.nearest,
                upSampling: Sampling.bicubic,
              )
            )
          ]
        )
      ],
    );
  }
}
