import 'dart:async';

import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, RouteString.homePage);
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  final Duration _duration = const Duration(milliseconds: 1500);
  final Tween<double> _tween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(

            child: Lottie.asset(
              'assets/lottie_real_estate.json',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              frameRate: FrameRate(60),
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),
          const SizedBox(height: 15),
          const Align(
            heightFactor: 1.5,
              child: SizedBox(
                  width: 260,
                  child: Image(image: ImageString.apniJaggahSplash))),
        ],
      ),
    );
  }
}
