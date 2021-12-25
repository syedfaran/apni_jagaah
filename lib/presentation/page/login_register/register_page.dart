import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close_rounded,
                      color: AppColor.grey, size: 40.0)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteString.login);
                  },
                  child: const SimpleText(AppString.login,
                      color: AppColor.textButtonColor)),
            ],
          ),
          const SimpleText(
            AppString.register,
            enumText: EnumText.extraBold,
            fontSize: 34,
            vertical: 35.0,
          ),
          /////////////////
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
            labelText: 'password',
          ),
          const TextFieldBorder(
            hintText: 'Enter Confirm Password',
            labelText: AppString.password,
          ),
          /////////////
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: const SimpleText(
                  AppString.forgotPassword,

                  color: AppColor.mainColor,
                )),
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
                onPressed: () {},
                child: const SimpleText(
                  'Login',
                  color: AppColor.whiteColor,
                )),
          ),
        ],
      ),
    ));
  }
}
