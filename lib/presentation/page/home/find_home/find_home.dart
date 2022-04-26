import 'dart:async';
import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/dependency_injection.dart';
import 'package:apni_jagaah/presentation/blocs/properties_bloc/properties_bloc.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/map_sample.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/listing.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindHome extends StatefulWidget {
  final bool _toggle;
  const FindHome(this._toggle,{Key? key}) : super(key: key);
  static const  _duration =  Duration(milliseconds: 500);

  @override
  State<FindHome> createState() => _FindHomeState();
}

class _FindHomeState extends State<FindHome> {
  final  _propertiesBloc = sl<PropertiesBloc>();
  @override
  void initState() {
    _propertiesBloc.add(const GetProperty());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      layoutBuilder: (first,firstKey,second,secondKey)=>Stack(
        children: [
          first,second
        ],
      ),

      duration: FindHome._duration,
      firstChild: const MapSample(),
      secondChild:  Listing(propertiesBloc: _propertiesBloc),
      crossFadeState: widget._toggle
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}

