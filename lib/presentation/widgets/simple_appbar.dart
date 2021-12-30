import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';


class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const SimpleAppbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: title!=null?SimpleText(title!):null,
      //backgroundColor: AppColor.whiteColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0,60);
}
