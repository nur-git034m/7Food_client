import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<bool> selectedBotton = [true, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(ctx) {
    return Expanded(
      child: FlutterMap(
        options: MapOptions(
          center: latlng.LatLng(56.704173, 11.543808),
          zoom: 13.0,
          // swPanBoundary:latlng.LatLng(56.6877, 11.5089),
          // nePanBoundary: latlng.LatLng(56.7378, 11.6644),
        ),
        layers: [
         TileLayerOptions(
            urlTemplate: 'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
            subdomains: ['tile0', 'tile1', 'tile2', 'tile3'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                  width: 80.0,
                  height: 80.0,
                  rotate: true,
                  point: latlng.LatLng(43.238949, 76.889709),
                  builder: (ctx) => const Icon(
                        Icons.person,
                        color: Colors.blue,
                      )),
            ],
          ),
        ],
      ),
    );
  }
}