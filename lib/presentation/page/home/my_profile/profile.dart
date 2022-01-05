import 'package:apni_jagaah/constant/app_string.dart';
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
    return SafeArea(
        child: Scaffold(
      appBar: const SimpleAppbar(title: AppString.profile),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        children: [
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
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(0, 45),
                      side: const BorderSide(
                          width: 1.0, color: AppColor.mainColor),
                    ),
                    onPressed: () {},
                    child: const SimpleText(AppString.upLoadAvatar,
                        color: AppColor.mainColor)),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(0, 45),
                      side: const BorderSide(
                          width: 1.0, color: AppColor.mainColor),
                    ),
                    onPressed: () {},
                    child: const SimpleText(AppString.upLoadCover,
                        color: AppColor.mainColor)),
              ),
            ],
          ),
          /////////////
          const SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(0, 45)),
              onPressed: () {},
              child: const SimpleText(AppString.submit,
                  color: AppColor.whiteColor)),
        ],
      ),
    ));
  }
}
