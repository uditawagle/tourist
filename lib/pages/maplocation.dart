
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:tourguide/Screen/map.dart';


// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();
//   TextEditingController _searchController = TextEditingController();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   //for general location
//   static final Marker _kGooglePlexMarker = Marker(
//     markerId: MarkerId('_kGooglePlex'),
//     infoWindow: InfoWindow(title: 'Google Plex'),
//     icon: BitmapDescriptor.defaultMarker,
//     position: LatLng(37.43296265331129, -122.08832357078792),
//   );

//   //for lake marker
//   static final Marker _kLakeMarker = Marker(
//     markerId: MarkerId('_kLakeMarket'),
//     infoWindow: InfoWindow(title: 'Lake'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//     position: LatLng(37.43296265331129, -122.08832357078792),
//   );

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unnecessary_new
//     return new Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Google Maps',
//         style: TextStyle(color: Colors.black),
//         ),
//         leading: Icon(Icons.map_sharp, color: Colors.black,),
//         backgroundColor: Color.fromARGB(255, 115, 148, 165),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 5, left: 5),
//                   child: TextFormField(
//                     controller: _searchController,
//                     textCapitalization: TextCapitalization.words,
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.location_on_outlined,
//                         size: 27,
//                       color: Colors.teal,
//                       ),
//                         hintText: 'Search by City Name',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Colors.red),
//                           borderRadius: BorderRadius.circular(15),
//                         )),
//                     onChanged: (value) {
//                       print(value);
//                     },
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () async {
//                   var place =
//                       await LocationService().getPlace(_searchController.text);
//                   _goToPlace(place);
//                 },
//                 icon: const Icon(Icons.search, size: 30
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: GoogleMap(
//               mapType: MapType.normal,
//               markers: {_kGooglePlexMarker, _kLakeMarker},
//               initialCameraPosition: _kGooglePlex,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: Text('To the lake!'),
//       //   icon: Icon(Icons.directions_boat),
//       // ),
//     );
//   }

//   Future<void> _goToPlace(Map<String, dynamic> place) async {
//     final double lat = place['geometry']['location']['lat'];
//     final double lng = place['geometry']['location']['lng'];

//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(
//       CameraPosition(target: LatLng(lat, lng), zoom: 12),
//     ));
//   }

// //   Future<void> _goToTheLake() async {
// //     final GoogleMapController controller = await _controller.future;
// //     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// //   }

// }
