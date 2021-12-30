import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(child: Text('add a property'),onPressed: (){
        Navigator.pushNamed(context, RouteString.addProperty);
      },),
    );
  }
}
