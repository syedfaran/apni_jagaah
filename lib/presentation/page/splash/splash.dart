import 'dart:async';

import 'package:apni_jagaah/constant/route_string.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
