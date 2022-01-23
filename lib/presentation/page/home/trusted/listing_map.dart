import 'dart:async';
import 'dart:math';
import 'package:apni_jagaah/presentation/page/home/find_home/map_sample.dart';
import 'package:apni_jagaah/presentation/widgets/decorated_card.dart';
import 'package:apni_jagaah/presentation/widgets/listing_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ListingMap extends StatefulWidget {
//   const ListingMap({Key? key}) : super(key: key);
//
//   @override
//   State<ListingMap> createState() => _ListingMapState();
// }
//
// class _ListingMapState extends State<ListingMap> {
//   final Completer<GoogleMapController> _controller = Completer();
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   final Marker marker = Marker(
//     markerId: const MarkerId('markerId'),
//     position: const LatLng(37.43296265331129, -122.08832357078792),
//     infoWindow: const InfoWindow(title: 'Demo Purpose', snippet: '*'),
//     onTap: () {
//
//     },
//   );
//   late final PageController pageController;
//   @override
//   void initState() {
//     pageController = PageController(viewportFraction: 1);
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Stack(
//       children: [
//         GoogleMap(
//           markers: {marker},
//           mapType: MapType.normal,
//           zoomControlsEnabled: false,
//           initialCameraPosition: _kGooglePlex,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//
//           },
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: AspectRatio(
//             aspectRatio: 1.2,
//             child: PageView.builder(
//               padEnds: false,
//               controller: pageController,
//               onPageChanged: (index)async{
//                 final GoogleMapController controller = await _controller.future;
//                 controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//               },
//               itemBuilder: (context, index) => const ListingCard(),
//               itemCount: 10,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }





class ListingMap extends StatelessWidget {
  const ListingMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) =>const DecoratedCard());
  }
}
