import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatefulWidget {
  final double? lat;
  final double? lon;
  MapsWidget({super.key, this.lat, this.lon});

  @override
  State<MapsWidget> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsWidget> {
  late LatLng LatLong;
  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;

  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    LatLong = LatLng(widget.lat ?? 0.0, widget.lon ?? 0.0);

    final marker = Marker(
      markerId: const MarkerId("user"),
      position: LatLong,
      onTap: () {
        mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLong, 18));
      },
    );
    markers.add(marker);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24), 
              child: GoogleMap(
                markers: markers,
                mapType: selectedMapType,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                initialCameraPosition: CameraPosition(zoom: 18, target: LatLong),
                onMapCreated: (controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: "zoom-in",
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomIn());
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.small(
                    heroTag: "zoom-out",
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomOut());
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: null,
                child: PopupMenuButton<MapType>(
                  onSelected: (MapType item) {
                    setState(() {
                      selectedMapType = item;
                    });
                  },
                  offset: const Offset(0, 54),
                  icon: const Icon(Icons.layers_outlined),
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<MapType>>[
                        const PopupMenuItem<MapType>(
                          value: MapType.normal,
                          child: Text('Normal'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.satellite,
                          child: Text('Satellite'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.terrain,
                          child: Text('Terrain'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.hybrid,
                          child: Text('Hybrid'),
                        ),
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
