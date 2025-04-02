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
          authToken: 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJYVUh3VWZKaHVDVWo0X3k4ZF8xM0hxWXBYMFdwdDd2anhob2FPLUxzREZFIn0.eyJleHAiOjE3NDM1NzY4NjIsImlhdCI6MTc0MzU3MzI2MiwianRpIjoiYzQ0ZjFkYTgtMmFkZS00NDJkLTg4MzktMTU4OGNmOTYwNjEyIiwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS5kYXRhc3BhY2UuY29wZXJuaWN1cy5ldS9hdXRoL3JlYWxtcy9DRFNFIiwiYXVkIjoiQ0xPVURGRVJST19QVUJMSUMiLCJzdWIiOiIyMTBiNTYwYy02NzNiLTRmNTUtYmU5OC1hYjk1OTVkYzhjN2MiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzaC0xOGJhMDM1Ny1hODY2LTRhMmQtODFmMS1iNjA4NGJlNjU4ODIiLCJzY29wZSI6IkFVRElFT…Jjb250ZXh0X2dyb3VwcyI6WyIvb3JnYW5pemF0aW9ucy9zaC1icm93c2VyQW5vbnltb3VzLyJdLCJ1c2VyX2NvbnRleHQiOiJzaC1icm93c2VyQW5vbnltb3VzIiwiY2xpZW50QWRkcmVzcyI6IjY0LjIyNS4xMjguMTQifQ.kF6HTdiCOwn_RT6gbCGnkNb8hEEsmgo0MkSel_yTOGj9mvzlF_9_qAcgFZHdGe-V-uWbDxqUBGiJ3OGtBCLCarVl8SDu_zEPwm9T1ib3Se_nhh7fvd_1Ch5t8t5OJhMQQgHdbWWpkK3vDNdFvmcKv7TyjVRF9i8G3wf6qPTKqJmvz4JFV5tvawTvFwv4CxnuOrjj1tJTwTDzUqhcJt7p7LnBCq6obbUSnvMYC07koQNIPPvnmVhx2ZuGSnCVFcD0GA4yNadTY22UwOCRTrydjdmCThcXEiVZljCUqqR9bIqShzsBtD3NgI8sgV2vyLmQbsD3htRZc4YzjDMeNNQOIg', 
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
