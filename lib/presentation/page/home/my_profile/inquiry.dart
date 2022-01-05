import 'package:apni_jagaah/constant/app_string.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  child: Column(
                    children: [
                      for(_FilterModel item in _FilterModel.filterList)
                      ValueListenableBuilder<bool>(
                        valueListenable: item.isChecked,
                        builder: (context,value,child)=>CheckboxListTile(
                          title: SimpleText(item.name),
                          onChanged: (bool? value) {
                            item.isChecked.value  =value!;
                          },
                          value: value,
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.filter),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      persistentFooterButtons: [
        for (String i in Inquiry._buttonList)
          OutlinedButton(
              onPressed: () {}, child: SimpleText(i, fontSize: Inquiry._cFontSize)),
      ],
      appBar: const SimpleAppbar(title: AppString.manageInquiry),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 15,
          columns:  <DataColumn>[
            for(_FilterModel item in _FilterModel.filterList)
             DataColumn(
                label: SimpleText(item.name,
                    fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.lastUpdated,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.property,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.inquirer,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.phone,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.email,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.message,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
            // DataColumn(
            //     label: SimpleText(AppString.status,
            //         fontSize: Inquiry._cFontSize, enumText: Inquiry._weight)),
          ],
          rows: const <DataRow>[
            DataRow(cells: [
              DataCell(SimpleText(
                '6 days ago',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'Dec 30, 2021\n10:27:44 PM',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'BobbyB',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                '03331258454',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'shackles_yahoo.com',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'inactive',
                fontSize: Inquiry._cFontSize,
              )),
            ]),
            DataRow(cells: [
              DataCell(SimpleText(
                '6 days ago',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'Dec 30, 2021\n10:27:44 PM',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'BobbyB',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                '03331258454',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'shackles_yahoo.com',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: Inquiry._cFontSize,
              )),
              DataCell(SimpleText(
                'inactive',
                fontSize: Inquiry._cFontSize,
              )),
            ]),
          ],
        ),
      ),
    );
  }
}


class _FilterModel{
  final String name;
  final ValueNotifier<bool> isChecked;
   _FilterModel(this.name,this.isChecked);
  static final  filterList = <_FilterModel>[
    _FilterModel(AppString.recentActivity,ValueNotifier(true)),
    _FilterModel(AppString.lastUpdated,ValueNotifier(true)),
    _FilterModel(AppString.property,ValueNotifier(true)),
    _FilterModel(AppString.inquirer,ValueNotifier(true)),
    _FilterModel(AppString.phone,ValueNotifier(true)),
    _FilterModel(AppString.email,ValueNotifier(true)),
    _FilterModel(AppString.message,ValueNotifier(true)),
    _FilterModel(AppString.status,ValueNotifier(true)),
  ];
}