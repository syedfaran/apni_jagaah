import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/blocs/properties_bloc/properties_bloc.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/source/model/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listing extends StatelessWidget {
  final PropertiesBloc propertiesBloc;

  const Listing({Key? key, required this.propertiesBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
    );
    return BlocBuilder<PropertiesBloc, PropertiesState>(
        bloc: propertiesBloc,
        builder: (context, state) {
          if (state is PropertiesInitial) return const SizedBox.shrink();
          if (state is PropertiesLoaded) {
            return _LoadedListing(properties: state.properties);
          }
          if (state is PropertiesInitial) return const SizedBox.shrink();
          if (state is PropertiesError) return SimpleText(state.message);
          return const Center(child:  SimpleText('SomeThing went Wrong'));
        });
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        itemCount: 3,
        itemBuilder: (context, index) => Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteString.detailPage);
                },
                splashColor: Colors.teal[200],
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Image(image: ImageString.place),
                        Card(
                          color: AppColor.blackColor.withOpacity(0.5),
                          child: const SimpleText(
                            'Updated 9 days ago',
                            color: AppColor.whiteColor,
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
            ));
  }
}

class _LoadedListing extends StatelessWidget {
  final List<Properties> properties;

  const _LoadedListing({Key? key, required this.properties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        itemCount: properties.length,
        itemBuilder: (context, index) => Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteString.detailPage);
                },
                splashColor: Colors.teal[200],
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const Image(image: ImageString.place),
                        Card(
                          color: AppColor.blackColor.withOpacity(0.5),
                          child: const SimpleText(
                            'Updated 9 days ago',
                            color: AppColor.whiteColor,
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
            ));
  }
}
