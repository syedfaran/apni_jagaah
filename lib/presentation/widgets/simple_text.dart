import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final EnumText? enumText;
  final double fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final double horizontal;
  final double vertical;
  final TextDecoration? decoration;
  final int? maxLine;
  final double? height;
  const SimpleText(this.text,
      {Key? key,
      this.maxLine,
      this.enumText,
      this.decoration,
      this.horizontal = 0.0,
      this.vertical = 0.0,
      this.fontSize = 20,
      this.textAlign,
        this.height,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLine,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          height: height,
            overflow: TextOverflow.fade,
            decoration: decoration,
            color: color,
            fontSize: fontSize,
            fontWeight: enumText == EnumText.light
                ? FontWeight.w300
                : enumText == EnumText.regular
                    ? FontWeight.w400
                    : enumText == EnumText.semiBold
                        ? FontWeight.w600
                        : enumText == EnumText.bold
                            ? FontWeight.w700
                            : enumText == EnumText.extraBold
                                ? FontWeight.w800
                                : FontWeight.w400),
      ),
    );
  }
}

enum EnumText { light, regular, semiBold, bold, extraBold }
