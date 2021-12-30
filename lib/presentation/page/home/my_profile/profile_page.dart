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

  static const _divider = Divider(thickness: 1.5, indent: 25.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SimpleText(AppString.joinToUnlock,
                    enumText: EnumText.extraBold, fontSize: 26, vertical: 25),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 45),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RouteString.register);
                        },
                        child: const SimpleText(
                          AppString.join,
                          color: AppColor.whiteColor,
                          enumText: EnumText.semiBold,
                        )),
                    const SizedBox(width: 15.0),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size(100, 45),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RouteString.login);
                        },
                        child: const SimpleText(
                          AppString.signIn,
                          enumText: EnumText.semiBold,
                        )),
                  ],
                ),
                const SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
        Card(
          child: Column(
            children: [
              _ProfileListTile(
                  title: AppString.properties,
                  iconData: Icons.title,
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.addProperty);
                  }),
              _divider,
              _ProfileListTile(
                title: AppString.inquires,
                onTap: () {},
                iconData: Icons.sort,
              ),
              _divider,
              _ProfileListTile(
                  title: AppString.reviews,
                  onTap: () {},
                  iconData: Icons.reviews),
              _divider,
              _ProfileListTile(
                  title: AppString.profile,
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.profile);
                  },
                  iconData: Icons.person),
              _divider,
              _ProfileListTile(
                  title: 'Settings', iconData: Icons.settings, onTap: () {}),
              _divider,
              _ProfileListTile(
                  title: AppString.signOut,
                  iconData: Icons.logout,
                  onTap: () {}),
              const SizedBox(height: 5.0),
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
      title: SimpleText(title, enumText: EnumText.regular),
      onTap: onTap,
    );
  }
}
