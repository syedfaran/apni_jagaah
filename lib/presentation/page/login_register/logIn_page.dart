import 'package:apni_jagaah/constant/app_string.dart';
import 'package:apni_jagaah/constant/route_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:apni_jagaah/presentation/widgets/text_field_border.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Navigator.pushReplacementNamed(context, RouteString.register);
                    },
                    child: const SimpleText(AppString.register,
                        color: AppColor.textButtonColor)),
              ],
            ),
            const SimpleText(
              AppString.login,
              enumText: EnumText.extraBold,
              fontSize: 34,
              vertical: 35.0,
            ),
            const TextFieldBorder(
                hintText: AppString.enterEmailOrAddress,
                labelText: 'email',
                hPadding: 0),
            const TextFieldBorder(
                hintText: AppString.enterPassword,
                labelText: 'password',
                hPadding: 0),
            TextButton(
                onPressed: () {},
                child: const SimpleText(
                  AppString.forgotPassword,
                  vertical: 16,
                  color: AppColor.mainColor,
                )),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const SimpleText(
                    'Login',
                    color: AppColor.white,
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
