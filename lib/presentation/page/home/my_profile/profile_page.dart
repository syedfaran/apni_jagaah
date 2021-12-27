import 'dart:async';

import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_) => Navigator.pushNamed(context, RouteString.login));
    // Future.microtask(() => Navigator.pushNamed(context, RouteString.login));
    Future((){
      Navigator.pushNamed(context, RouteString.login);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SimpleText('Profile Page'),
    );
  }

}
