import 'dart:math';

import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png')),
          title: const SimpleText('PARTNER AGENT', fontSize: 16),
          subtitle: const SimpleText('Kem Smith',
              color: AppColor.mainColor, fontSize: 22, enumText: EnumText.bold),
          tileColor: Colors.grey[300],
        ),
        Expanded(
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
          shaderCallback: (rect) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.8,1],
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height)),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                    leading: const SizedBox(
                        width: 55,
                        height: 55,
                        child: Image(
                          image: ImageString.place,
                          fit: BoxFit.cover,
                        )),
                    title: Row(
                      children:  [
                        Random().nextBool()?Icon(Icons.star, color: Colors.amber):SizedBox(),
                        Random().nextBool()?Icon(Icons.star, color: Colors.amber):SizedBox(),
                        Random().nextBool()?Icon(Icons.star, color: Colors.amber):SizedBox(),
                        Random().nextBool()?Icon(Icons.star, color: Colors.amber):SizedBox(),
                        Random().nextBool()?Icon(Icons.star, color: Colors.amber):SizedBox(),
                      ],
                    ),
                    subtitle: SimpleText(
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                      fontSize: 15,
                    ),
                  )),
        )),
      ],
    );
  }
}
