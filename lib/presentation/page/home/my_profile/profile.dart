import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/decorated_drop_down.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ValueNotifier<String> _valueNotifier = ValueNotifier('');
  static const List<String> _list = ['Owner', 'Realtor', 'Builder', 'Seller'];

  @override
  Widget build(BuildContext context) {
    const double globalSize = 300;
    const EdgeInsets globalPadding =  EdgeInsets.symmetric(horizontal: 25.0, vertical: 25);
    return SafeArea(
        child: Scaffold(
      appBar: const SimpleAppbar(title: AppString.profile),
      body: ListView(
        padding: globalPadding,
        children: [
          //todo later convert it to SizedBox
          SizedBox(
            height: globalSize,
            //color: Colors.amber,
            child: Stack(
              children: [
                Container(
                  height: globalSize / 2 + 50,
                  alignment: Alignment.bottomRight,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    color: Colors.indigo,
                    image: DecorationImage(
                        image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox.square(
                        dimension: 45,
                        child: Card(child: Icon(Icons.camera_alt))),
                  ),
                ),
                const Positioned.fill(
                    top: globalSize / 2 -50,
                    child: Align(
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: AppColor.mainColor,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/avatar.png'),
                          child: Align(
                            alignment: Alignment.bottomRight,

                            child: SizedBox.square(
                                dimension: 40,
                                child: Card(
                                    child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ))),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          /////DropDownButton/////
          DecoratedDropDown(
              hintText: AppString.selectAccountType,
              list: _list,
              valueNotifier: _valueNotifier),
          //////////////
          const TextFieldBorder(
            hintText: 'Enter First Name',
            labelText: AppString.firstName,
          ),
          const TextFieldBorder(
            hintText: 'Enter Last Name',
            labelText: AppString.lastName,
          ),
          const TextFieldBorder(
            hintText: 'Enter Username',
            labelText: AppString.userName,
          ),
          const TextFieldBorder(
            hintText: AppString.enterPhoneNumber,
            labelText: 'Phone',
          ),
          const TextFieldBorder(
            hintText: 'Enter Email Address',
            labelText: AppString.emailAddress,
          ),
          const TextFieldBorder(
            hintText: AppString.enterPassword,
            labelText: AppString.password,
          ),
          const TextFieldBorder(
            hintText: 'Enter Confirm Password',
            labelText: AppString.confirmPassword,
          ),
          /////////////
          // Row(
          //   children: [
          //     Expanded(
          //       child: OutlinedButton(
          //           style: OutlinedButton.styleFrom(
          //             fixedSize: const Size(0, 45),
          //             side: const BorderSide(
          //                 width: 1.0, color: AppColor.mainColor),
          //           ),
          //           onPressed: () {},
          //           child: const SimpleText(AppString.upLoadAvatar,
          //               color: AppColor.mainColor)),
          //     ),
          //     const SizedBox(width: 16.0),
          //     Expanded(
          //       child: OutlinedButton(
          //           style: OutlinedButton.styleFrom(
          //             fixedSize: const Size(0, 45),
          //             side: const BorderSide(
          //                 width: 1.0, color: AppColor.mainColor),
          //           ),
          //           onPressed: () {},
          //           child: const SimpleText(AppString.upLoadCover,
          //               color: AppColor.mainColor)),
          //     ),
          //   ],
          // ),
          /////////////
          const SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(0, 45)),
              onPressed: () {},
              child: const SimpleText(AppString.submit,
                  color: AppColor.whiteColor,)),
        ],
      ),
    ));
  }
}
