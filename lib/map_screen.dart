import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:info_window_flutter_map/app_constants.dart';
import 'package:info_window_flutter_map/geo_park_list.dart';
import 'package:info_window_flutter_map/popup_container.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late PopupController _popupController;

  @override
  void initState() {
    super.initState();
    _popupController = PopupController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌎️  Flutter Map'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.withOpacity(0.5),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialZoom: 3,
          initialCenter: LatLng(22.5937, 78.9629),
        ),
        children: [
          TileLayer(urlTemplate: AppConstants.styleUrl),
          PopupMarkerLayer(
            options: PopupMarkerLayerOptions(
              popupController: _popupController,
              markerCenterAnimation: const MarkerCenterAnimation(),
              markers: geoParkList
                  .map(
                    (touristPlace) => Marker(
                      point: touristPlace.location,
                      rotate: true,
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'assets/map_marker.png',
                      ),
                    ),
                  )
                  .toList(),
              popupDisplayOptions: PopupDisplayOptions(
                builder: (context, marker) {
                  final selectedMarkerIndex = geoParkList.indexOf(
                    geoParkList.firstWhere(
                      (element) => element.location == marker.point,
                    ),
                  );
                  return PopupContainer(
                    title: geoParkList[selectedMarkerIndex].title,
                    description: geoParkList[selectedMarkerIndex].description,
                    imageUrl: geoParkList[selectedMarkerIndex].image,
                    rating: geoParkList[selectedMarkerIndex].rating,
                    onCloseTap: () {
                      _popupController.hideAllPopups();
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
