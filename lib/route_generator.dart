import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/page/home/dashboard/add_property/add_property.dart';
import 'package:apni_jagaah/presentation/page/home/dashboard/property.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/detail_page.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/filter.dart';
import 'package:apni_jagaah/presentation/page/home/home.dart';
import 'package:apni_jagaah/presentation/page/home/dashboard/inquiry.dart';
import 'package:apni_jagaah/presentation/page/home/my_profile/change_password.dart';
import 'package:apni_jagaah/presentation/page/home/my_profile/profile.dart';
import 'package:apni_jagaah/presentation/page/home/dashboard/review.dart';
import 'package:apni_jagaah/presentation/page/login_register/logIn_page.dart';
import 'package:apni_jagaah/presentation/page/login_register/register_page.dart';
import 'package:apni_jagaah/presentation/page/splash/splash.dart';
import 'package:flutter/material.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteString.initialPage:
       // return MaterialPageRoute(builder: (_) => const SplashPage());
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteString.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteString.detailPage:
        return MaterialPageRoute(builder: (_)=>const DetailPage());
      case RouteString.login:
        return MaterialPageRoute(builder: (_)=>const LogInPage());
      case RouteString.register:
        return MaterialPageRoute(builder: (_)=>const RegisterPage());
      case RouteString.addProperty:
        return MaterialPageRoute(builder: (_)=>const AddProperty());
      case RouteString.profile:
        return MaterialPageRoute(builder: (_)=>const Profile());
      case RouteString.filter:
        return MaterialPageRoute(builder: (_)=>const Filter());
      case RouteString.inquiry:
        return MaterialPageRoute(builder: (_)=>const Inquiry());
      case RouteString.review:
        return MaterialPageRoute(builder: (_)=>const Review());
      case RouteString.property:
        return MaterialPageRoute(builder: (_)=>const Property());
      case RouteString.password:
        return MaterialPageRoute(builder: (_)=>const ChangePassword());
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