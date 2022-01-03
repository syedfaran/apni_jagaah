import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool enablePop;

  const SimpleAppbar({Key? key, this.title, this.enablePop=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.5,
      leading: enablePop
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const  Icon(Icons.arrow_back_ios, color: AppColor.mainColor))
          : null,
      title: title != null ? SimpleText(title!) : null,
      backgroundColor: AppColor.whiteColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, 60);
}
