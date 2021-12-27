import 'dart:async';
import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/first_child.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/second_child.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindHome extends StatefulWidget {
  const FindHome({Key? key}) : super(key: key);

  @override
  State<FindHome> createState() => FindHomeState();
}

class FindHomeState extends State<FindHome> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Duration duration = const Duration(milliseconds: 500);
  bool _toggle = false;

  void toggle() {
    setState(() {
      _toggle = !_toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedCrossFade(
          duration: duration,
          firstChild: const MapSample(),
          secondChild: const SecondChild(),
          crossFadeState: _toggle
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: const BoxDecoration(
              color: AppColor.offWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 25),
                            hintText: 'City,Address'),
                        style: const TextStyle(fontSize: 25),
                        onChanged: (val) {},
                      ),
                    ),
                    TextButton(
                        onPressed: toggle,
                        child: SimpleText(_toggle ? 'List' : 'Map')),
                  ],
                ),
                const Divider(thickness: 1.5),
                OutlinedButton(
                    onPressed: () {},
                    child: const SimpleText(AppString.filter)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
