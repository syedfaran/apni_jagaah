import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SimpleAppbar(
        title: AppString.changePassword,
      ),
      body: Column(
        children:  [
          const  TextFieldBorder(
            labelText: AppString.password+":",
            hintText: AppString.enterPassword,
            hPadding: 16.0,
          ),
          const  TextFieldBorder(
            labelText: AppString.confirmPassword+":",
            hintText: 'Enter Confirm Password',
            hPadding: 16.0,
          ),
          ElevatedButton(onPressed: (){}, child: SimpleText(AppString.submit)),
        ],
      ),
    );
  }
}
