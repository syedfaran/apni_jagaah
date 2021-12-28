import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/find_home.dart';
import 'package:apni_jagaah/presentation/page/home/my_profile/profile_page.dart';
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
  final ValueNotifier<int> mapToListNotifier = ValueNotifier(0);

  @override
  void dispose() {
    indexNotifier.dispose();
    mapToListNotifier.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    indexNotifier.value = index;
  }

  bool _toggle = true;

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
        builder: (context, value, child) => Scaffold(
            appBar: PreferredSize(
                preferredSize: appbarDecider(value)
                    ? const Size(0, 125)
                    : const Size(0, 60),
                child: AppBar(
                  elevation: appbarDecider(value)?1.0:0.0,
                  title: appbarDecider(value)
                      ? null
                      : SimpleText(EnumAppBar.values.elementAt(value).name,
                          enumText: EnumText.light,color: Colors.black87,),
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
                                      fixedSize: const Size(110, 45)),
                                  onPressed: () {},
                                  child: const SimpleText(
                                    AppString.filter,
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
                      icon: Icon(Icons.search), label: 'find Home'),
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
              const Center(child:  SimpleText('dashboard')),
              const Center(child:  SimpleText('favourite')),
              const ProfilePage(),
            ].elementAt(value)),
      ),
    );
  }
}

enum EnumAppBar { findHome, Trusted, DashBoard, Favourite, Profile }
