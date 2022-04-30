import 'dart:async';

import 'package:apni_jagaah/presentation/blocs/properties_bloc/properties_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSampleParam extends StatefulWidget {
  final PropertiesBloc? propertiesBloc;

  const MapSampleParam({Key? key,required this.propertiesBloc}) : super(key: key);

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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  void initState() {
    _goToTheLake();
    super.initState();
  }
  final List<Marker> marker = [];

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
          }
          setState(() {

          });
        }
      },
      child: GoogleMap(
        mapType: MapType.normal,
        markers: marker.toSet(),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
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
