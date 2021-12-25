import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/detail_page.dart';
import 'package:apni_jagaah/presentation/page/home/home.dart';
import 'package:apni_jagaah/presentation/page/splash/splash.dart';
import 'package:flutter/material.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteString.initialPage:
        //return MaterialPageRoute(builder: (_) => const SecondChildDetailPage());
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteString.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteString.detailPage:
        return MaterialPageRoute(builder: (_)=>const SecondChildDetailPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}