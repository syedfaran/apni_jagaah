import 'package:apni_jagaah/presentation/blocs/temp_bloc/temp_bloc.dart';

import 'package:apni_jagaah/presentation/page/home/find_home/find_home.dart';

import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_localizations.dart';
import '../../../dependency_injection.dart';

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
    SimpleText(
      'Index 1: Business',
    ),
    SimpleText(
      'Index 2: School',
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {

    });
    indexNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) => _widgetOptions.elementAt(value)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'find Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'DashBoard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Profile',
            ),
          ],
          currentIndex: indexNotifier.value,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
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
