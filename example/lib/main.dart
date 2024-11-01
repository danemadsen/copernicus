import 'package:copernicus/copernicus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          data: [
            CopernicusRequestData(
              satillite: CopernicusSatillite.s2l2a, 
              filteringOptions: CopernicusFilteringOptions(
                satillite: CopernicusSatillite.s2l2a,
                mosaickingOrder: CopernicusMosaickingOrder.mostRecent,
                maxCloudCoverage: 100,
              ),
              processingOptions: CopernicusProcessingOptions(
                satillite: CopernicusSatillite.s2l2a,
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
