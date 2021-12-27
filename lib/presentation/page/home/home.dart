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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 150),
          child: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) => EnumAppBar.values[value] ==
                    EnumAppBar.findHome
                ? PreferredSize(
              preferredSize: const Size(0, 150),
                  child: Card(
                      color: AppColor.offWhiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 25),
                                      hintText: 'City,Address'),
                                  style: const TextStyle(fontSize: 25),
                                  onChanged: (val) {},
                                ),
                              ),
                              const SizedBox(
                                  height: 50,
                                  child: VerticalDivider(
                                    thickness: 0.5,
                                    color: AppColor.blackColor,
                                  )),
                              TextButton(
                                  onPressed: toggle,
                                  child: SimpleText(_toggle ? 'List' : 'Map')),
                            ],
                          ),
                          const Divider(thickness: 1.5),
                          OutlinedButton(
                              onPressed: () {},
                              child: const SimpleText(
                                AppString.filter,
                              )),
                        ],
                      ),
                    ),
                )
                : AppBar(
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) => <Widget>[
                  FindHome(_toggle),
                  const TrustedPage(),
                  const SimpleText('Index 2: School'),
                  const SimpleText('Index 2: School'),
                  const ProfilePage(),
                ].elementAt(value)),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: AppColor.whiteColor),
          child: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'find Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.filter),
                  label: 'Trusted',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'DashBoard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'My Profile',
                ),
              ],
              currentIndex: value,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}


enum EnumAppBar { findHome, trusted, dashboard, favourite, profile }

// body: Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//        Text(AppLocalizations.of(context)!.translate('testing')!),
//       TextButton(onPressed: (){
//         temp.add(GetJsonData());
//       }, child: Text('fetch Data')),
//       BlocBuilder<TempBloc, TempState>(
//           bloc: temp, builder: (context, state) {
//         if (state is TempInitial) {
//           return Text('initial State',style: Theme.of(context).textTheme.bodyText1,);
//         } else if (state is TempLoading) {
//           return Text('Loading....');
//         } else if (state is TempLoaded) {
//           return Text(state.placeHolder.title);
//         } else if (state is TempError) {
//           return Text(state.message);
//         } else {
//           return Text('SomeThing Went Wrong');
//         }
//       }),
//     ],
//   ),
// ),



// class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final ValueNotifier indexNotifier;
//   const SearchAppBar({Key? key,required this.indexNotifier}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: indexNotifier,
//       builder: (context, value, child) => EnumAppBar.values[value] ==
//           EnumAppBar.findHome
//           ? PreferredSize(
//         preferredSize: const Size(0, 150),
//         child: Card(
//           color: AppColor.offWhiteColor,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintStyle: TextStyle(fontSize: 25),
//                           hintText: 'City,Address'),
//                       style: const TextStyle(fontSize: 25),
//                       onChanged: (val) {},
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 50,
//                       child: VerticalDivider(
//                         thickness: 0.5,
//                         color: AppColor.blackColor,
//                       )),
//                   TextButton(
//                       onPressed: toggle,
//                       child: SimpleText(_toggle ? 'List' : 'Map')),
//                 ],
//               ),
//               const Divider(thickness: 1.5),
//               OutlinedButton(
//                   onPressed: () {},
//                   child: const SimpleText(
//                     AppString.filter,
//                   )),
//             ],
//           ),
//         ),
//       )
//           : AppBar(
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => throw UnimplementedError();
// }
