import 'dart:async';

import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, RouteString.homePage));
    super.initState();
  }

  final Duration _duration = const Duration(milliseconds: 1500);
  final Tween<double> _tween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: TweenAnimationBuilder<double>(
        duration: _duration,
        tween: _tween,
        builder: (context, value, child) {
          return Opacity(opacity: value, child: child);
        },
        child: const Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Image(image: ImageString.apniJaggahSplash),
        )),
      ),
    );
  }
}
