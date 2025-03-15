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
          authToken: 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJYVUh3VWZKaHVDVWo0X3k4ZF8xM0hxWXBYMFdwdDd2anhob2FPLUxzREZFIn0.eyJleHAiOjE3NDIwMDcxODEsImlhdCI6MTc0MjAwMzU4MSwianRpIjoiOTBkOTg2MzYtZjcwMy00N2YyLTk4MTgtMjZhMDU1NTNjMmE0IiwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS5kYXRhc3BhY2UuY29wZXJuaWN1cy5ldS9hdXRoL3JlYWxtcy9DRFNFIiwiYXVkIjoiQ0xPVURGRVJST19QVUJMSUMiLCJzdWIiOiIyMTBiNTYwYy02NzNiLTRmNTUtYmU5OC1hYjk1OTVkYzhjN2MiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzaC0xOGJhMDM1Ny1hODY2LTRhMmQtODFmMS1iNjA4NGJlNjU4ODIiLCJzY29wZSI6IkFVRElFTkNFX1BVQkxJQyB1c2VyLWNvbnRleHQiLCJjbGllbnRIb3N0IjoiNjQuMjI1LjEyOC4xNCIsImNsaWVudElkIjoic2gtMThiYTAzNTctYTg2Ni00YTJkLTgxZjEtYjYwODRiZTY1ODgyIiwib3JnYW5pemF0aW9ucyI6WyJzaC1icm93c2VyQW5vbnltb3VzIl0sInVzZXJfY29udGV4dF9pZCI6IjYwMzYyYTc2LWQ4NmMtNGRiYy1iZDc3LTY3MmE3MmMzYTIxMyIsImNvbnRleHRfcm9sZXMiOnt9LCJjb250ZXh0X2dyb3VwcyI6WyIvb3JnYW5pemF0aW9ucy9zaC1icm93c2VyQW5vbnltb3VzLyJdLCJ1c2VyX2NvbnRleHQiOiJzaC1icm93c2VyQW5vbnltb3VzIiwiY2xpZW50QWRkcmVzcyI6IjY0LjIyNS4xMjguMTQifQ.afaFZ2RgaV-2tH-0bu_UxF9B34IsFWidcBDTxK473e8w8RN_EGlFOsqF7GrICMs51R7CbTmWpa6GKG2X3iKh_6UN99HL1ojpOLKa-pIfG2o3p7zpxB-twS27e5WHyHvKIBk7ONXm18uS_G_13atntfeX5zAdFQzj0-eZBFsJrgCF-5l9Pn11-qmDR7T68Z5js_ldO7WASFryqByNGiS3MqlGiaV-PqGuCRD8l-2T-pD8HW8et0h5oAnhx7RAjMtWh2auU5IEaokRpzshP9AcJuzaW2999l15s8eJpHsFBsvh6OjI7ImVaqHUqijJfnWzzc2OvBVz9mrtjyR9wZXruA', 
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
