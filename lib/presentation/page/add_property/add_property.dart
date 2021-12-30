import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/map_sample.dart';
import 'package:apni_jagaah/presentation/widgets/decorated_drop_down.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/material.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final purposeNotifier = ValueNotifier<String>('');
  final categoryNotifier = ValueNotifier<String>('');
  final typeNotifier = ValueNotifier<String>('');
  final featureNotifier = ValueNotifier<String>('');
  final unitNotifier = ValueNotifier<String>('');
  static const purposeList = ['Buy', 'Rent', 'Sell'];
  static const categoryList = [
    'Residential',
    'Commercial',
    'Bungalow',
    'Property'
  ];
  static const typeList = <String>[];
  static const featureList = <String>[];
  static const unitList = ['Sq.Ft', 'Marla', 'Sq Yard', 'Kanal'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SimpleText(AppString.addProperty)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
        children: [
          DecoratedDropDown(
            valueNotifier: purposeNotifier,
            list: purposeList,
            labelText: AppString.purpose,
            hintText: AppString.selectPurpose,
          ),
          const TextFieldBorder(
            labelText: AppString.propertyTitle,
            hintText: AppString.enterAnAttractiveTitle,
          ),
          DecoratedDropDown(
            valueNotifier: categoryNotifier,
            list: categoryList,
            labelText: AppString.categoryR,
            hintText: AppString.selectCategory,
          ),
          DecoratedDropDown(
            valueNotifier: typeNotifier,
            list: typeList,
            labelText: AppString.typeR,
            hintText: AppString.selectType,
          ),
          DecoratedDropDown(
            valueNotifier: featureNotifier,
            list: featureList,
            labelText: AppString.feature,
            hintText: AppString.selectFeature,
          ),
          DecoratedDropDown(
            valueNotifier: unitNotifier,
            list: unitList,
            labelText: AppString.unit,
            hintText: AppString.selectUnit,
          ),
          const TextFieldBorder(
            labelText: AppString.priceR,
            hintText: AppString.enterPrice,
          ),
          Row(
            children: const [
              Expanded(
                  child: TextFieldBorder(
                labelText: AppString.areaR,
                hintText: AppString.enterAreaR,
              )),
              SizedBox(width: 25),
              Expanded(
                  child: TextFieldBorder(
                labelText: AppString.room,
                hintText: AppString.enterRoom,
              )),
            ],
          ),
          Row(
            children: const [
              Expanded(
                  child: TextFieldBorder(
                labelText: AppString.bedroom,
                hintText: AppString.enterBedroom,
              )),
              SizedBox(width: 25),
              Expanded(
                  child: TextFieldBorder(
                labelText: AppString.bathroom,
                hintText: AppString.enterBathroom,
              )),
            ],
          ),
           TextFieldBorder(
            labelText: AppString.geoLocation,
            hintText: AppString.enterGeoLocation,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.location_on)),
          ),
          const AbsorbPointer(
              absorbing: true,
              child: AspectRatio(aspectRatio: 1.5, child: MapSample())),
          const TextFieldBorder(
            labelText: AppString.addressLineOne,
            hintText: AppString.enterAddressLineOne,
          ),
          const TextFieldBorder(
            labelText: AppString.addressLineTwo,
            hintText: AppString.enterAddressLineTwo,
          ),
          const TextFieldBorder(
            labelText: AppString.postalCode,
            hintText: AppString.enterPostalCode,
          ),
          const TextFieldBorder(
            labelText: AppString.location,
            hintText: AppString.enterLocation,
          ),
          const TextFieldBorder(
            labelText: AppString.buildingAge,
            hintText: AppString.enterBuildingAge,
          ),
        ],
      ),
    );
  }
}
