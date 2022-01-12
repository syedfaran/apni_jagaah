import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);
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

        onPressed: () {},
        child: const Icon(Icons.filter),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      persistentFooterButtons: [
        for (String i in _buttonList)
          OutlinedButton(
              onPressed: () {}, child: SimpleText(i, fontSize: _cFontSize)),
      ],
      appBar: const SimpleAppbar(
        title: AppString.manageReview,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 15,
          columns: const <DataColumn>[
            DataColumn(
                label: SimpleText(AppString.recentActivity,
                    fontSize: _cFontSize, enumText: _weight)),
            DataColumn(
                label: SimpleText(AppString.lastUpdated,
                    fontSize: _cFontSize, enumText: _weight)),
            DataColumn(
                label: SimpleText(AppString.property,
                    fontSize: _cFontSize, enumText: _weight)),
            DataColumn(
                label: SimpleText(AppString.review,
                    fontSize: _cFontSize, enumText: _weight)),
            DataColumn(
                label: SimpleText(AppString.status,
                    fontSize: _cFontSize, enumText: _weight)),
          ],
          rows: const <DataRow>[
            DataRow(cells: [
              DataCell(SimpleText(
                '6 days ago',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'Dec 30, 2021\n10:27:44 PM',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'inactive',
                fontSize: _cFontSize,
              )),
            ]),
            DataRow(cells: [
              DataCell(SimpleText(
                '6 days ago',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'Dec 30, 2021\n10:27:44 PM',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'inactive',
                fontSize: _cFontSize,
              )),
            ]),
            DataRow(cells: [
              DataCell(SimpleText(
                '6 days ago',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'Dec 30, 2021\n10:27:44 PM',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'test',
                fontSize: _cFontSize,
              )),
              DataCell(SimpleText(
                'inactive',
                fontSize: _cFontSize,
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
