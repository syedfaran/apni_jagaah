import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';
class ListingCard extends StatelessWidget {
  const ListingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteString.detailPage);
        },
        splashColor: Colors.teal[200],
        child: Column(
          children: [
            Stack(
              children:  [
                const  Image(image: ImageString.place),
                Card(
                  color: AppColor.blackColor.withOpacity(0.5),
                  child:const SimpleText(
                    'Updated 9 days ago',
                    color: AppColor.white,
                    fontSize: 12,
                    horizontal: 4,
                    vertical: 4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SimpleText('\$1,391,900',
                          enumText: EnumText.semiBold),
                      const Spacer(flex: 6),
                      Icon(Icons.favorite_outline,
                          size: 30, color: Colors.grey[600]),
                      const Spacer(),
                      Icon(Icons.share_outlined,
                          size: 30, color: Colors.grey[600])
                    ],
                  ),
                  const SimpleText(
                    '4 beds 2 Bath 1040Sq.Ft',
                    fontSize: 14,
                  ),
                  const SizedBox(height: 15.0),
                  const SimpleText(
                    '405 3rd Ave Ne, Glenwood, MN 56334',
                    fontSize: 14,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
