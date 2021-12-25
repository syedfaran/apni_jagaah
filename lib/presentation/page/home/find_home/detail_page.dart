import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/material.dart';

class SecondChildDetailPage extends StatelessWidget {
  const SecondChildDetailPage({Key? key}) : super(key: key);
  static const imageList = [
    ImageString.roomOne,
    ImageString.roomTwo,
    ImageString.roomThree
  ];

  Widget miniInfo(String option, String value) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(children: [
          SimpleText(value, enumText: EnumText.semiBold),
          SimpleText(option, fontSize: 16),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          //imagePageView
          SliverToBoxAdapter(
            child: SizedBox(
              height: 230,
              child: PageView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Image(fit: BoxFit.fill, image: imageList[index]),
              ),
            ),
          ),
          //description
          SliverList(
              delegate: SliverChildListDelegate([
            Card(
              child: ListTile(
                title:
                    const SimpleText('\$250,000', enumText: EnumText.extraBold),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SimpleText('Est\$926/mo',
                        decoration: TextDecoration.underline,
                        color: AppColor.grey,
                        enumText: EnumText.regular,
                        fontSize: 14),
                    SimpleText('124 WOODLAWN Ave\nJERSEY CITY, NJ 07305',
                        fontSize: 16, vertical: 20),
                  ],
                ),
                trailing: FittedBox(
                  child: Row(
                    children: [
                      miniInfo('Beds', '3'),
                      miniInfo('Baths', '2'),
                      miniInfo('Sq. Ft', '1200'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(title: SimpleText('Key Details', fontSize: 30)),
                  _KeyDetail(option: AppString.category, value: 'Residential'),
                  _KeyDetail(option: AppString.type, value: 'Plot'),
                  _KeyDetail(option: AppString.features, value: 'Corner'),
                  _KeyDetail(option: AppString.price, value: '1.42 Crore'),
                  _KeyDetail(option: AppString.area, value: '10 Marla'),
                  _KeyDetail(option: AppString.rooms, value: '9'),
                  _KeyDetail(option: AppString.bedrooms, value: '5'),
                  _KeyDetail(option: AppString.bathrooms, value: '4'),
                  _KeyDetail(option: AppString.availableUnits, value: '1'),
                  _KeyDetail(option: AppString.pdf, value: 'N/A'),
                ],
              ),
            ),
          ])),
          //about this home
          SliverToBoxAdapter(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SimpleText(AppString.aboutThisHome,
                        fontSize: 30, vertical: 16, enumText: EnumText.light),
                    const SimpleText(AppString.descriptionText,
                        textAlign: TextAlign.justify, maxLine: 4),
                    TextButton(
                        onPressed: () {},
                        child: const SimpleText(AppString.continueReading,
                            fontSize: 24,color: AppColor.textButtonColor,)),
                  ],
                ),
              ),
            ),
          ),
          //inquiryForm
          const SliverToBoxAdapter(child: _InquiryForm()),

          //SliverChildBuilderDelegate(builder),
        ],
      ),
    ));
  }
}

class _KeyDetail extends StatelessWidget {
  final String option;
  final String? value;

  const _KeyDetail({Key? key, required this.option, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: SimpleText(option, color: AppColor.grey),
        trailing: value != null ? SimpleText(value!) : null);
  }
}

class _InquiryForm extends StatelessWidget {
  const _InquiryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SimpleText(AppString.inquiryFrom, fontSize: 30),
          const TextFieldBorder(hintText: AppString.enterFullName),
          const TextFieldBorder(hintText: AppString.enterPhoneNumber),
          const TextFieldBorder(hintText: AppString.enterEmailAddress),
          const TextFieldBorder(hintText: AppString.enterMessage),
          const SizedBox(height: 15),
          OutlinedButton(
              onPressed: () {}, child: const SimpleText(AppString.submit)),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
