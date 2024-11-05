# Copernicus

A flutter_maps extension package for utilising the Copernicus API to retrieve sentinel satellite imagery.

## Features

This package provides a `CopernicusLayer` widget that can be used in conjunction with the `flutter_map` package to display Copernicus satellite imagery on a map.

## Getting started

To use this package, add `copernicus` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```yaml
dependencies:
  copernicus: ^1.0.1
```

## Example

Here is an example of how to use this package:

```dart
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
              satillite: CopernicusSatillite.s2l2a, 
              filteringOptions: CopernicusFilteringOptions(
                mosaickingOrder: CopernicusMosaickingOrder.mostRecent,
                maxCloudCoverage: 100,
              ),
              processingOptions: CopernicusProcessingOptions(
                downSampling: CopernicusSampling.nearest,
                upSampling: CopernicusSampling.bicubic,
              )
            )
          ]
        )
      ],
    );
  }
}
```

## Additional information

For more information about the copernicus API, please visit the [Copernicus API documentation](https://documentation.dataspace.copernicus.eu/Home.html)
