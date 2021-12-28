import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/page/home/find_home/map_sample.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static const imageList = [
    ImageString.roomOne,
    ImageString.roomTwo,
    ImageString.roomThree
  ];

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget miniInfo(String option, String value) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SimpleText(value, enumText: EnumText.extraBold),
          SimpleText(option, fontSize: 12, color: _grey),
        ]),
      );
  final ValueNotifier<bool> continueReadingNotifier = ValueNotifier(false);

  void continueReading() {
    continueReadingNotifier.value = !continueReadingNotifier.value;
  }

  @override
  void dispose() {
    continueReadingNotifier.dispose();
    super.dispose();
  }

  final Color _grey = Colors.grey[600]!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          //imagePageView
          SliverToBoxAdapter(
            child: SizedBox(
              height: 290,
              child: PageView.builder(
                itemCount: DetailPage.imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Image(fit: BoxFit.fill, image: DetailPage.imageList[index]),
              ),
            ),
          ),
          //Mini description
          SliverToBoxAdapter(
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SimpleText('\$250,000',
                            enumText: EnumText.extraBold),
                        SimpleText('Est \$926/mo',
                            decoration: TextDecoration.underline,
                            color: _grey,
                            enumText: EnumText.regular,
                            fontSize: 14),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        miniInfo('Beds', '3'),
                        miniInfo('Baths', '2'),
                        miniInfo('Sq. Ft.', '1200'),
                      ],
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SimpleText('124 WOODLAWN Ave\nJERSEY CITY, NJ 07305',
                        fontSize: 13, vertical: 20,color: Colors.black87,),
                    RichText(
                      text: const TextSpan(
                        text: 'Estimate:',
                        style: TextStyle(
                            decoration: TextDecoration.underline, color: Colors.black87),
                        children: [
                          TextSpan(
                            text: ' \$290,195',
                      style: TextStyle(
                          decoration: TextDecoration.none,color: Colors.black87),
                          ),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //mapSample
          const SliverToBoxAdapter(
            child: AspectRatio(
                aspectRatio: 1.6,
                child: AbsorbPointer(
                    absorbing: true, child: Card(child: MapSample()))),
          ),
          //key Info
          SliverToBoxAdapter(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(title: SimpleText('Key Details', fontSize: 24.5)),
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
          ),
          //about this home
          SliverToBoxAdapter(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.50),
                child: ValueListenableBuilder<bool>(
                    valueListenable: continueReadingNotifier,
                    builder: (context, value, child) =>Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SimpleText(AppString.aboutThisHome,
                            fontSize: 24.5, vertical: 16, enumText: EnumText.light),
                        SimpleText(
                            AppString.descriptionText,
                            fontSize: 14,
                            height: 1.5,
                            textAlign: TextAlign.left,
                            maxLine: value ? null : 4),
                        TextButton(
                            onPressed: continueReading,
                            child:  SimpleText(
                              value?'Show Less':AppString.continueReading,
                              fontSize: 18,
                              enumText: EnumText.bold,
                              color: Colors.teal,
                            )),
                      ],
                    ),
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
        dense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
        title: SimpleText(option, color: Colors.grey[600], fontSize: 18),
        trailing: value != null ? SimpleText(value!, fontSize: 18) : null);
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
          const TextFieldBorder(
              hintText: AppString.enterFullName, hPadding: 16.0),
          const TextFieldBorder(
              hintText: AppString.enterPhoneNumber, hPadding: 16.0),
          const TextFieldBorder(
              hintText: AppString.enterEmailAddress, hPadding: 16.0),
          const TextFieldBorder(
              hintText: AppString.enterMessage, hPadding: 16.0),
          const SizedBox(height: 15),
          OutlinedButton(
              onPressed: () {}, child: const SimpleText(AppString.submit)),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
