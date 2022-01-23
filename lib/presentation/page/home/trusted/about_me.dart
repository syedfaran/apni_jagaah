import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  final TabController tabController;

  const AboutMe(this.tabController, {Key? key}) : super(key: key);
  static const double _globalSize = 300;
  static const EdgeInsets _globalPadding =
      EdgeInsets.symmetric(horizontal: 25.0, vertical: 25);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: _globalPadding,
      children: [
        SizedBox(
          height: _globalSize,
          //color: Colors.amber,
          child: Stack(
            children: [
              Container(
                height: _globalSize / 2 + 50,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                  image: DecorationImage(
                      image: AssetImage('assets/background.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              const Positioned.fill(
                  top: _globalSize / 2 - 50,
                  child: Align(
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: AppColor.mainColor,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const SimpleText('PARTNER AGENT', textAlign: TextAlign.center),
        const SimpleText('Kem Smith', textAlign: TextAlign.center),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SimpleText('5.0'),
            const Icon(Icons.star, color: Colors.amber),
            const Icon(Icons.star, color: Colors.amber),
            const Icon(Icons.star, color: Colors.amber),
            const Icon(Icons.star, color: Colors.amber),
            const Icon(Icons.star, color: Colors.amber),
            TextButton(
                onPressed: () {
                  tabController.animateTo(2);
                },
                child:
                    const SimpleText('11 Reviews', color: AppColor.mainColor)),

          ],
        ),
        const _ListTile(
            title: 'Agent License',
            subtitle: '668112 MD, SP200202355 DC, RSROO3798'),
        const _ListTile(
            title: 'Brokerage',
            subtitle: 'Long & Foster Real Estate, Inc'),
        const _ListTile(
            title: 'Home Closed',
            subtitle: '42'),
        const _ListTile(
            title: 'Kem\'s NeighbourHoods',
            subtitle: 'Baltimore, Bel Air, Skyesville, Upper Marlboro....'),
        const Divider(),
        const  SimpleText('Kem\'s Deal',fontSize: 28),

        ListTile(
          title: const SimpleText('Homes Listed', color: AppColor.mainColor),
          onTap: (){
            tabController.animateTo(1);
          },
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ListTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(contentPadding: EdgeInsets.zero,
      title: SimpleText(title, enumText: EnumText.bold),
      subtitle: SimpleText(subtitle,fontSize: 16),
    );
  }
}
