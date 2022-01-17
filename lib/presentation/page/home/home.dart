import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/page/home/dashboard/dashboard.dart';
import 'package:apni_jagaah/presentation/page/home/favourite/favourite.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/find_home.dart';
import 'package:apni_jagaah/presentation/page/home/my_profile/my_profile.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/trusted_page.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> indexNotifier = ValueNotifier(0);


  @override
  void dispose() {
    indexNotifier.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    indexNotifier.value = index;
  }

  bool _toggle = false;

  void toggle() {
    setState(() {
      _toggle = !_toggle;
    });
  }

  static bool appbarDecider(int value) =>
      EnumAppBar.values[value] == EnumAppBar.findHome;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<int>(
        valueListenable: indexNotifier,
        builder: (context, value, child) =>
            Scaffold(
                appBar: PreferredSize(
                    preferredSize: appbarDecider(value)
                        ? const Size(0, 100)
                        : const Size(0, 60),
                    child: AppBar(
                      elevation: appbarDecider(value) ? 1.0 : 0.0,
                      title: appbarDecider(value)
                          ? null
                          : SimpleText(EnumAppBar.values
                          .elementAt(value).name + (EnumAppBar.values[value] == EnumAppBar.Trusted?' Builder':''),
                          enumText: EnumText.light, color: Colors.black87),
                      backgroundColor: AppColor.whiteColor,
                      flexibleSpace: appbarDecider(value)
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100),
                                      hintText: 'City,Address'),
                                  style: const TextStyle(fontSize: 20),
                                  onChanged: (val) {},
                                ),
                              ),
                              const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    thickness: 0.5,
                                    color: AppColor.blackColor,
                                  )),
                              TextButton(
                                  onPressed: toggle,
                                  child: SimpleText(_toggle ? 'List' : 'Map',
                                      horizontal: 10.0)),
                            ],
                          ),
                          const Divider(thickness: 1.5, height: 0.0),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 22.0),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    fixedSize: const Size(90, 35)),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteString.filter);
                                },
                                child: const SimpleText(
                                  AppString.filter,
                                  fontSize: 16.0,
                                )),
                          ),
                        ],
                      )
                          : const Align(
                          alignment: Alignment.bottomCenter,
                          child: Divider(
                            color: Colors.black26,
                            thickness: 1.5,
                            height: 0.0,
                          )),
                    )),
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: Theme(
                  data: Theme.of(context).copyWith(
                    // sets the background color of the `BottomNavigationBar`
                    canvasColor: AppColor.whiteColor,
                  ),
                  child: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: 'Find Home'),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.filter),
                        label: 'Trusted',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard_outlined),
                        label: 'DashBoard',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_outline),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outlined),
                        label: 'My Profile',
                      ),
                    ],
                    currentIndex: value,
                    selectedItemColor: AppColor.blackColor,
                    unselectedItemColor: AppColor.grey,
                    onTap: _onItemTapped,
                  ),
                ),
                body: <Widget>[
                  FindHome(_toggle),
                  const TrustedPage(),
                  const Dashboard(),
                  const Favourite(),
                  const MyProfile(),
                ].elementAt(value)),
      ),
    );
  }
}

enum EnumAppBar { findHome, Trusted, DashBoard, Favourite, Profile }
