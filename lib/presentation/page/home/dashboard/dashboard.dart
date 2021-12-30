import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const colorList = [
    [Color(0xff606c88), Color(0xff3f4c6b)],
    [Color(0xff283048), Color(0xff859398)],
    [Color(0xff232526), Color(0xff414345)],
    [Color(0xff085078), Color(0xff85D8CE)],
    [Color(0xff16222A), Color(0xff3A6073)],
    [Color(0xff2b5876),Color(0xff4e4376)],
    [Color(0xff536976),Color(0xff292E49)],
  ];

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: TextButton(child: Text('add a property'),onPressed: (){
    //     Navigator.pushNamed(context, RouteString.addProperty);
    //   },),
    // );
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5),
      itemCount: colorList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _DashboardContainer(color: colorList[index][0],colorsTwo: colorList[index][1],);
      },
    );
  }
}

class _DashboardContainer extends StatelessWidget {
  final Color color;
  final Color colorsTwo;
  const _DashboardContainer({Key? key, required this.color,required this.colorsTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),

        boxShadow:const  [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        gradient: LinearGradient(
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
            colors: [color,colorsTwo]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SimpleText('0',
              color: AppColor.whiteColor,
              fontSize: 38,
              enumText: EnumText.extraBold),
          SizedBox(height: 10),
          SimpleText('Total Properties',
              color: AppColor.whiteColor,
              fontSize: 18,
              enumText: EnumText.light),
        ],
      ),
    );
  }
}
