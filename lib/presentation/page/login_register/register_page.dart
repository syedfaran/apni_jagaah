import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const List<String> _list = ['Owner', 'Realtor', 'Builder', 'Seller'];

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ValueNotifier<String> _valueNotifier = ValueNotifier('');

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close_rounded,
                      color: AppColor.grey, size: 40.0)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RouteString.login);
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
          /////DropDownButton/////
          _DropDown(list: RegisterPage._list, valueNotifier: _valueNotifier),
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
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            title: RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'terms and conditions',
                      style: const TextStyle(color: AppColor.textButtonColor),
                      recognizer: TapGestureRecognizer()..onTap=(){},
                    ),
                  ],
                  text: 'I agree to the ',
                  style:const TextStyle(color: AppColor.blackColor)),
            ),
          ),
          ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(0,45)),
              onPressed: () {},
              child: const SimpleText(AppString.register,
                  color: AppColor.whiteColor)),

        ],
      ),
    ));
  }
}

class _DropDown extends StatelessWidget {
  final ValueNotifier<String> valueNotifier;
  final List<String> list;

  const _DropDown({Key? key, required this.list, required this.valueNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: valueNotifier,
      builder: (context, value, child) => InputDecorator(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
          hintText: 'Select Account Type',
        ),
        isEmpty: value == '',
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          value: value == '' ? null : value,
          isDense: true,
          items: list
              .map((e) => DropdownMenuItem(child: SimpleText(e), value: e))
              .toList(),
          onChanged: (val) {
            valueNotifier.value = val!;
          },
        )),
      ),
    );
  }
}
