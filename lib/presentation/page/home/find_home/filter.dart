import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/decorated_drop_down.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  static List<String> selectedPurposeList = [];
  static List<String> selectedTypeList = [];
  final ValueNotifier<String> cityNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> locationNotifier = ValueNotifier<String>('');

  @override
  void dispose() {
    super.dispose();
  }

  static const divider = Divider(
    color: AppColor.blackColor,
  );
  static const EnumText fontWeight = EnumText.extraBold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppbar(title: AppString.searchFilter),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 26.0),
        children: [
          const SimpleText(AppString.purpose, enumText: fontWeight),
          _WrapLayout(
              optionList: _FilterModel.purposeList,
              selectedListed: selectedPurposeList),
          const SizedBox(height: 15),
          const SimpleText(AppString.typeR, enumText: fontWeight),
          _WrapLayout(
              optionList: _FilterModel.typeList,
              selectedListed: selectedTypeList),
          const SizedBox(height: 15),
          const SimpleText(AppString.city, enumText: fontWeight),
          DecoratedDropDown(
              list: const ['Karachi', 'Sindh', 'Lahore'],
              valueNotifier: cityNotifier,
              hintText: 'Select City'),
          const SizedBox(height: 15),
          const SimpleText(AppString.location, enumText: fontWeight),
          const SizedBox(height: 10),
          DropdownSearch<String>.multiSelection(
              mode: Mode.BOTTOM_SHEET,
              items: const [
                "Nipa",
                "Defence Phase 1",
                "Gulshan",
                'UAE',
                'Arabia',
              ],
              showSearchBox: true,
              showSelectedItems: true,
              onChanged: print,
              selectedItems: const ["Brazil"]),
        ],
      ),
    );
  }
}

class _FilterModel {
  final String item;
  bool isSelected;

  _FilterModel(this.item, this.isSelected);

  static final purposeList = <_FilterModel>[
    _FilterModel('Buy', false),
    _FilterModel('Sell', false),
    _FilterModel('Rent', false),
  ];
  static final typeList = <_FilterModel>[
    _FilterModel('Flat', false),
    _FilterModel('Bungalow', false),
    _FilterModel('Shop', false),
    _FilterModel('Mall', false),
    _FilterModel('Plot', false),
  ];
}

class _WrapLayout extends StatefulWidget {
  final String? hintText;
  final List<_FilterModel> optionList;
  final List<String> selectedListed;

  const _WrapLayout(
      {Key? key,
      required this.optionList,
      required this.selectedListed,
      this.hintText})
      : super(key: key);

  @override
  State<_WrapLayout> createState() => _WrapLayoutState();
}

class _WrapLayoutState extends State<_WrapLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          children: widget.optionList
              .asMap()
              .map((element, purpose) => MapEntry(
                  element,
                  FilterChip(
                    label: SimpleText(purpose.item),
                    onSelected: (value) {
                      setState(() {
                        purpose.isSelected = value;
                      });
                      if (value) {
                        widget.selectedListed.add(purpose.item);
                      } else {
                        widget.selectedListed.remove(purpose.item);
                      }
                    },
                    selected: purpose.isSelected,
                  )))
              .values
              .toList(),
        ),
        // InputDecorator(
        //   isEmpty: widget.selectedListed.isEmpty,
        //   decoration: const InputDecoration(
        //     hintText: 'Noting is Seleted',
        //     isDense: false,
        //     border: OutlineInputBorder(),
        //     focusedBorder:
        //         OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        //   ),
        //   child: Wrap(
        //     spacing: 10,
        //     children: widget.selectedListed.map((e) => SimpleText(e)).toList(),
        //   ),
        // ),
      ],
    );
  }
}
