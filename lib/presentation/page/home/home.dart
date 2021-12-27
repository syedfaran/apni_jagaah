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

  static const List<Widget> _widgetOptions = <Widget>[
    FindHome(),
    TrustedPage(),
    SimpleText(
      'Index 2: School',
    ),
    SimpleText(
      'Index 2: School',
    ),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    indexNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) =>
                _widgetOptions.elementAt(value)),
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
  }
}
