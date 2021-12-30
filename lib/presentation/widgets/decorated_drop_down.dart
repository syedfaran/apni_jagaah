import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class DecoratedDropDown extends StatelessWidget {
  final ValueNotifier<String> valueNotifier;
  final List<String> list;
  final String? hintText;
  final String? labelText;

  const DecoratedDropDown(
      {Key? key,
      required this.list,
      required this.valueNotifier,
      this.labelText,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: valueNotifier,
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText != null
                ? SimpleText(labelText!,
                color: Colors.grey,
                enumText: EnumText.extraBold,
                fontSize: 16.0)
                : const SizedBox.shrink(),
            InputDecorator(
              decoration:  InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                hintText: hintText,
              ),
              isEmpty: value.isEmpty,
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                value: value.isEmpty ? null : value,
                isDense: true,
                items: list
                    .map((e) => DropdownMenuItem(child: SimpleText(e), value: e))
                    .toList(),
                onChanged: (val) {
                  valueNotifier.value = val!;
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
