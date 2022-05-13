import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/dependency_injection.dart';
import 'package:apni_jagaah/presentation/blocs/trustedbuilder_bloc/trusted_builder_bloc.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/listing.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/about_me.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/listing_map.dart';
import 'package:apni_jagaah/presentation/page/home/trusted/review.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrustedPage extends StatefulWidget {
  const TrustedPage({Key? key}) : super(key: key);

  @override
  State<TrustedPage> createState() => _TrustedPageState();
}

class _TrustedPageState extends State<TrustedPage> {
  final _trustedBloc = sl<TrustedBuilderBloc>();

  @override
  void initState() {
    _trustedBloc.add(const GetTrustedBuilder());
    super.initState();
  }

  @override
  void dispose() {
    _trustedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrustedBuilderBloc, TrustedBuilderState>(
      bloc: _trustedBloc,
      builder: (context, state) {
        if (state is TrustedBuilderLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is TrustedBuilderLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            itemCount: state.trustedBuilder.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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
                  SimpleText(state.trustedBuilder[index].title!.rendered!,
                      enumText: EnumText.extraBold),
                  const SimpleText(
                    '2 months ago',
                    fontSize: 16,
                  ),
                ],
              );
            },
          );
        }
        if (state is TrustedBuilderError)
          return Center(child: SimpleText(state.message));
        return const SimpleText('Something Went Wrong');
      },
    );
  }
}

class _TempListing extends StatefulWidget {
  const _TempListing({Key? key}) : super(key: key);

  @override
  _TempListingState createState() => _TempListingState();
}

class _TempListingState extends State<_TempListing>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
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
        bottom: TabBar(
          controller: tabController,
          tabs: const <Widget>[
            SimpleText('About Me', fontSize: 22),
            SimpleText('Listing', fontSize: 22),
            SimpleText('Review', fontSize: 22),
          ],
          indicatorColor: AppColor.mainColor,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          AboutMe(tabController),
          const ListingMap(),
          const Review(),
        ],
      ),
    );
  }
}
