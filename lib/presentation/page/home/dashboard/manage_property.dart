import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/decorated_card.dart';
import 'package:apni_jagaah/presentation/widgets/decorated_drop_down.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Property extends StatefulWidget {
  const Property({Key? key}) : super(key: key);

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  final ValueNotifier<String> _categoryNotifier = ValueNotifier('');
  final ValueNotifier<String> _statusNotifier = ValueNotifier('');
  static const categoryList = [
    AppString.status,
    AppString.lastUpdated,
    'City',
    'Purpose',
    AppString.name,
    AppString.classification
  ];
  static const statusList = [
    AppString.active,
    AppString.inactive,
  ];

  static Future<void> delay() async {
    await Future.delayed(const Duration(milliseconds: 800));
  }
  bool showList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        title: AppString.manageProperty,
        action: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteString.addProperty);
              },
              icon: const Icon(Icons.add, color: AppColor.blackColor))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                DecoratedDropDown(
                  valueNotifier: _categoryNotifier,
                  list: categoryList,
                  hintText: 'select Category',
                ),
                ValueListenableBuilder<String>(
                    valueListenable: _categoryNotifier,
                    builder: (context, value, child) {
                      if (value.isEmpty) return const SizedBox.shrink();
                      return DecoratedDropDown(
                        valueNotifier: _statusNotifier,
                        list: statusList,
                        hintText: AppString.selectStatus,
                      );
                    }),
                ElevatedButton(
                    onPressed: () {
                      if (_categoryNotifier.value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('kindly select category'),
                          behavior: SnackBarBehavior.floating,
                        ));

                      }else{
                        setState(() {
                          showList = true;
                        });
                      }
                    },
                    child:
                        const SimpleText('search', color: AppColor.white)),
              ],
            ),
          ),
          showList?Expanded(
              child: FutureBuilder<void>(
            future: delay(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return const Align(child: CircularProgressIndicator.adaptive());
              }
              return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) =>const DecoratedCard());
            },
          )):const SizedBox.shrink()
        ],
      ),
    );
  }
}
