import 'dart:async';

import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/blocs/properties_bloc/properties_bloc.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/source/model/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSampleParam extends StatefulWidget {
  final PropertiesBloc? propertiesBloc;

  const MapSampleParam({Key? key, required this.propertiesBloc})
      : super(key: key);

  @override
  State<MapSampleParam> createState() => _MapSampleParamState();
}

class _MapSampleParamState extends State<MapSampleParam> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.6844, 73.0479),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
  Future<void> _goToTheLake(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat, lng),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }

  @override
  void initState() {
    _goToTheLake(33.6844, 73.0479);
    super.initState();
  }

  final List<Marker> marker = [];
  final List<Properties> properties = [];
  final Color _grey = Colors.grey[600]!;
  Widget miniInfo(String option, String value) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [
      SimpleText(value, color: AppColor.white),
      SimpleText(option, fontSize: 12, color: AppColor.white),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertiesBloc, PropertiesState>(
      bloc: widget.propertiesBloc,
      listener: (_, state) {
        if (state is PropertiesLoaded) {
          for (var i in state.properties) {
            marker.add(Marker(
                markerId: MarkerId(i.id.toString()),
                position: LatLng(
                    double.parse(
                        i.propertyMeta!.rEALHOMESPropertyLocation!.latitude!),
                    double.parse(i.propertyMeta!.rEALHOMESPropertyLocation!
                        .longitude!))));
            properties.add(i);
          }
          setState(() {});
        }
      },
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            compassEnabled: false,
            markers: marker.toSet(),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: properties.length,
                onPageChanged: (value) {
                  _goToTheLake(
                      double.parse(properties[value]
                          .propertyMeta!
                          .rEALHOMESPropertyLocation!
                          .latitude!),
                      double.parse(properties[value]
                          .propertyMeta!
                          .rEALHOMESPropertyLocation!
                          .longitude!));
                },
                itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.all(14.0),

                  decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: Image.network(
                                  'https://apnijagaah.com/wp-content/uploads/' +
                                      properties[index]
                                          .propertyMeta!
                                          .rEALHOMESPropertyImages!
                                          .first
                                          .file!)
                              .image,
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(right: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.blue[900],borderRadius: BorderRadius.circular(4.0)),
                            child: const Image(image: ImageString.home,height: 30),
                          ),
                          SimpleText(
                              'Rs ' +
                                  properties[index]
                                      .propertyMeta!
                                      .rEALHOMESPropertyPrice!,
                              enumText: EnumText.semiBold,color: AppColor.white,fontSize: 18),
                          const Spacer(),
                          miniInfo('Beds', '3'),
                          miniInfo('Baths', '2'),
                          miniInfo('Sq. Ft.', '1200'),
                        ],
                      ),
                      const SimpleText('262 Route 9 St \nWest Creek, NJ 08092',color: AppColor.white,fontSize: 14),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.6844, 73.0479),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState() {
    //_goToTheLake();
    super.initState();
  }

  final List<Marker> marker = [];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: marker.toSet(),
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
