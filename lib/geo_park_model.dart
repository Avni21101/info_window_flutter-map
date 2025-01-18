import 'package:latlong2/latlong.dart';

class GeoPark {
  GeoPark({
    required this.title,
    required this.location,
    required this.description,
    required this.image,
    required this.rating,
  });

  final String title;
  final LatLng location;
  final String description;
  final String image;
  final int rating;
}
