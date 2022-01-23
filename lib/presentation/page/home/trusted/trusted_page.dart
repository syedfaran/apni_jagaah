import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/listing.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/about_me.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/listing_map.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/review.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
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
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const _TempListing()));
              },
              child: const CircleAvatar(
                backgroundColor: AppColor.whiteColor,
                backgroundImage: ImageString.homeAvatar,
                maxRadius: 45,
              ),
            ),
            const SimpleText('Gawar', enumText: EnumText.extraBold),
            const SimpleText(
              '2 months ago',
              fontSize: 16,
            ),
          ],
        );
      },
    );
  }
}

class _TempListing extends StatefulWidget {
  const _TempListing({Key? key}) : super(key: key);

  @override
  _TempListingState createState() => _TempListingState();
}

class _TempListingState extends State<_TempListing> with SingleTickerProviderStateMixin{
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this,initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const SimpleText('User Detail'),
        bottom:  TabBar(
          controller: tabController,
          tabs: const <Widget>[
            SimpleText('About Me', fontSize: 22),
            SimpleText('Listing', fontSize: 22),
            SimpleText('Review', fontSize: 22),
          ],
          indicatorColor: AppColor.mainColor,
        ),
      ),
      body:  TabBarView(
        controller: tabController,
        physics:const NeverScrollableScrollPhysics(),
        children: <Widget>[
          AboutMe(tabController),
          const  ListingMap(),
          const  Review(),
        ],
      ),
    );
  }
}
