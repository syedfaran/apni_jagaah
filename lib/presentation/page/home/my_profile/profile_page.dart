import 'dart:async';
import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SimpleText(AppString.joinToUnlock,
                  fontSize: 28, vertical: 25),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteString.register);
                        },
                        child: const SimpleText(AppString.join,
                            color: AppColor.whiteColor)),
                  ),
                  const SizedBox(width: 15.0),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteString.login);
                        },
                        child: const SimpleText(AppString.signIn)),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              _ProfileListTile(
                  title: AppString.properties,
                  iconData: Icons.title,
                  onTap: () {}),
              _ProfileListTile(
                title: AppString.inquires,
                onTap: () {},
                iconData: Icons.sort,
              ),
              _ProfileListTile(
                  title: AppString.reviews,
                  onTap: () {},
                  iconData: Icons.reviews),
              _ProfileListTile(
                  title: AppString.profile,
                  onTap: () {},
                  iconData: Icons.person),
              _ProfileListTile(
                  title: AppString.signOut,
                  iconData: Icons.logout,
                  onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final VoidCallback? onTap;

  const _ProfileListTile(
      {Key? key, this.onTap, this.iconData, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: SimpleText(title),
      onTap: onTap,

    );
  }
}
