import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class TextFieldBorder extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final double hPadding;

  const TextFieldBorder(
      {Key? key, this.hintText, this.labelText, this.hPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: hPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? SimpleText(labelText!,color: Colors.grey,enumText: EnumText.extraBold,fontSize: 16.0) : const SizedBox.shrink(),
          TextField(
            //enabled: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
