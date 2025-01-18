import 'package:info_window_flutter_map/geo_park_model.dart';
import 'package:latlong2/latlong.dart';

final List<GeoPark> geoParkList = [
  GeoPark(
    image: 'assets/gir.jpeg',
    title: 'Sasan Gir National Park',
    description: 'Sasan Gir, Junagadh District, Gujarat',
    location: const LatLng(21.1240, 70.8240),
    rating: 5,
  ),
  GeoPark(
    image: 'assets/madumalai.jpeg',
    title: 'Mudumalai Tiger Reserve',
    description: 'Mudumalai Wildlife Sanctuary, Nilgiri District, Tamil Nadu',
    location: const LatLng(11.4994, 76.6299),
    rating: 3,
  ),
  GeoPark(
    image: 'assets/kaziranga.jpeg',
    title: 'Kaziranga National Park',
    description: 'Kaziranga National Park, Kanchanjuri, Nagaon District, Assam',
    location: const LatLng(26.5775, 93.1711),
    rating: 4,
  ),
  GeoPark(
    image: 'assets/ranthambore.jpeg',
    title: 'Ranthambore National Park',
    description: 'Ranthambore, Sawai Madhopur District, Rajasthan',
    location: const LatLng(26.0173, 76.5026),
    rating: 3,
  ),
  GeoPark(
    image: 'assets/pench.jpeg',
    title: 'Pench National Park',
    description: 'Pench, Seoni District, Madhya Pradesh',
    location: const LatLng(21.7000, 79.3100),
    rating: 4,
  ),
];
