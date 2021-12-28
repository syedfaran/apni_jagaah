import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class TrustedPage extends StatelessWidget {
  const TrustedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children:const  [
            CircleAvatar(
              backgroundColor: AppColor.whiteColor,
              backgroundImage: ImageString.homeAvatar,
              maxRadius: 45,
            ),
            SimpleText('Gawar',enumText: EnumText.extraBold),
            SimpleText('2 months ago',fontSize: 16,),
          ],
        );
      },
    );
  }
}
