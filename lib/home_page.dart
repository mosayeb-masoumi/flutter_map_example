import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    setMarkers();
  }

  void setMarkers() {
    markers = [
      Marker(
          point: LatLng(35.7219, 51.3347),
          builder: (context) {
            return Icon(
              Icons.pin_drop,
              color: Colors.red,
              size: 30,
            );
          }),
      Marker(
          point: LatLng(35.7315, 51.2241),
          builder: (context) {
            return Icon(
              Icons.pin_drop,
              color: Colors.blue,
            );
          }),
      Marker(
          point: LatLng(35.7411, 51.4138),
          builder: (context) {
            return Icon(
              Icons.pin_drop,
              color: Colors.black,
            );
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: const LatLng(35.7219, 51.3347),
                    zoom: 10,
                    onLongPress: (tapPosition, point) {
                      markers.add(
                        Marker(
                            point: point,
                            builder: (context) {
                              return const Icon(
                                Icons.pin_drop,
                                color: Colors.orange,
                              );
                            }),
                      );

                      setState(() {});
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      // urlTemplate: 'https://stamen-tiles.a.ssl.fastly.net/toner-background/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                      // subdomains: ['a','b','c'],
                    ),
                    MarkerLayer(
                      markers: markers,
                    ),

                    // PolygonLayer(
                    //   polygonCulling: false,
                    //   polygons: [
                    //     Polygon(
                    //         points: [
                    //           const LatLng(35.72, 51.33),
                    //           const LatLng(32.22, 50.1),
                    //           const LatLng(32.22, 48.1),
                    //           const LatLng(35.72, 48.1),
                    //         ],
                    //         color: Colors.blue.withOpacity(0.5),
                    //         borderStrokeWidth: 2,
                    //         borderColor: Colors.red,
                    //         isFilled: true)
                    //   ],
                    // ),

                    // PolylineLayer(
                    //   polylineCulling: false,
                    //   polylines: [
                    //     Polyline(
                    //         points: [
                    //           const LatLng(35.72, 51.33),
                    //           const LatLng(32.22, 50.1),
                    //           const LatLng(32.22, 48.1),
                    //           const LatLng(35.72, 48.1),
                    //         ],
                    //         color: Colors.red,
                    //         strokeWidth: 2,
                    //     )
                    //   ],
                    // ),

                    CircleLayer(
                      circles: [
                        CircleMarker(
                            point: LatLng(35.72, 51.33),
                            radius: 10000,
                            useRadiusInMeter: true,
                            color: Colors.red.withOpacity(0.5),
                            borderColor: Colors.blue.withOpacity(0.7),
                            borderStrokeWidth: 5),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
