import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Inquiry extends StatelessWidget {
  const Inquiry({Key? key}) : super(key: key);
  static const _cFontSize = 12.5;
  static const EnumText _weight = EnumText.bold;
  static const List<String> _buttonList = [
    'Copy',
    'CSV',
    'Excel',
    'PDF',
    'Print'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              context: context,
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (_FilterModel item in _FilterModel.filterList)
                      ValueListenableBuilder<bool>(
                        valueListenable: item.isChecked,
                        builder: (context, value, child) => CheckboxListTile(
                          title: SimpleText(item.name),
                          onChanged: (bool? value) {
                            item.isChecked.value = value!;
                          },
                          value: value,
                        ),
                      ),
                  ],
                );
              });
        },
        child: const Icon(Icons.filter),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      persistentFooterButtons: [
        for (String i in Inquiry._buttonList)
          OutlinedButton(
              onPressed: () {},
              child: SimpleText(i, fontSize: Inquiry._cFontSize)),
      ],
      appBar: const SimpleAppbar(title: AppString.manageInquiry),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                const ListTile(
                    trailing:
                        IconButton(icon: Icon(Icons.delete), onPressed: null),
                    dense: true),
                _InquiryTile(
                  image: ImageString.property,
                  title: 'Property',
                  subtitle:
                      'Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself.',
                  valueNotifier: _FilterModel.filterList[6].isChecked,
                ),
                _InquiryTile(
                    title: 'Jan 12, 2021',
                    image: ImageString.date,
                    valueNotifier: _FilterModel.filterList[1].isChecked),
                const Divider(thickness: 1.2, endIndent: 50.0, indent: 15),
                _InquiryTile(
                    title: 'Son Goku',
                    image: ImageString.person,
                    valueNotifier: _FilterModel.filterList[3].isChecked),
                _InquiryTile(
                  title: '+92331258454',
                  image: ImageString.phone,
                  valueNotifier: _FilterModel.filterList[4].isChecked,
                ),
                _InquiryTile(
                    title: 'Orochi@Zac.com',
                    image: ImageString.email,
                    valueNotifier: _FilterModel.filterList[5].isChecked),
                const Divider(thickness: 1.2, endIndent: 50.0, indent: 15),
                _InquiryTile(
                  image: ImageString.message,
                  title: 'Message',
                  valueNotifier: _FilterModel.filterList[5].isChecked,
                  subtitle:
                      'Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself.',
                ),
                const ListTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterModel {
  final String name;
  final ValueNotifier<bool> isChecked;

  _FilterModel(this.name, this.isChecked);

  static final filterList = <_FilterModel>[
    _FilterModel(AppString.recentActivity, ValueNotifier(true)),
    _FilterModel(AppString.lastUpdated, ValueNotifier(true)),
    _FilterModel(AppString.property, ValueNotifier(true)),
    _FilterModel(AppString.inquirer, ValueNotifier(true)),
    _FilterModel(AppString.phone, ValueNotifier(true)),
    _FilterModel(AppString.email, ValueNotifier(true)),
    _FilterModel(AppString.message, ValueNotifier(true)),
    _FilterModel(AppString.status, ValueNotifier(true)),
  ];
}

class _InquiryTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final ImageProvider image;
  final ValueNotifier<bool> valueNotifier;

  const _InquiryTile(
      {Key? key,
      required this.title,
      required this.image,
      required this.valueNotifier,
      this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      builder: (context, value, child) {
        if (value) {
          return ListTile(
            dense: true,
            leading: Image(image: image, height: 25),
            title: SimpleText(title,
                fontSize: 16,
                enumText: subtitle != null ? EnumText.extraBold : null),
            subtitle:
                subtitle != null ? SimpleText(subtitle!, fontSize: 12) : null,
          );
        }
        return const SizedBox.shrink();
      },
      valueListenable: valueNotifier,
    );
  }
}
