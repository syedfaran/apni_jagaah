import 'dart:async';
import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/map_sample.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/listing.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindHome extends StatelessWidget {
  final bool _toggle;
  const FindHome(this._toggle,{Key? key}) : super(key: key);
  static const  _duration =  Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      layoutBuilder: (first,firstKey,second,secondKey)=>Stack(
        children: [
          first,second
        ],
      ),
      duration: _duration,
      firstChild: const MapSample(),
      secondChild: const Listing(),
      crossFadeState: _toggle
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}

