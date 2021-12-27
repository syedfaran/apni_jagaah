import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Listing extends StatelessWidget {
  const Listing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
    );
    return AspectRatio(
      aspectRatio: 3/4,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          itemCount: 3,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RouteString.detailPage);
            },
            child: Card(
                  child: Column(
                    children: [
                      const Image(image: ImageString.place),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                SimpleText(
                                  '\$139,900',
                                  enumText: EnumText.semiBold,
                                ),
                                Spacer(),
                                Icon(Icons.favorite_border),
                                Icon(Icons.share)
                              ],
                            ),
                            const SizedBox(height: 5),
                            const SimpleText('3bed 1Bath 1040Sq.Ft',
                                fontSize: 14),
                            const SizedBox(height: 5),
                            const SimpleText('405 3rd Ave Ne, Glenwood, MN 56334',
                                fontSize: 14),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          )),
    );
  }
}
