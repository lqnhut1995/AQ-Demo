import 'package:demo/utils.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode focusNode;
  final ValueChanged onFieldSubmitted;
  final ValueChanged onChanged;
  final bool autoFocus;
  final TextInputAction inputAction;
  final maxLine;

  const TextFieldWidget(
      {Key key,
      this.icon,
      this.hint,
      this.errorText,
      this.isObscure = false,
      this.inputType,
      this.textController,
      this.isIcon = true,
      this.padding = const EdgeInsets.all(0),
      this.hintColor = Colors.grey,
      this.iconColor = Colors.grey,
      this.focusNode,
      this.onFieldSubmitted,
      this.onChanged,
      this.autoFocus = false,
      this.inputAction,
      this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 40,
        child: TextFormField(
          controller: textController,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: inputAction,
          obscureText: this.isObscure,
          // maxLength: 25,
          maxLines: this.maxLine,
          keyboardType: this.inputType,
          style: Theme.of(context).textTheme.body1,
          decoration: InputDecoration(
              hintText: this.hint,
              fillColor: HexColor('#B3B6BD').withOpacity(0.2),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                  borderSide: BorderSide(
                      color: HexColor('#414A5A').withOpacity(0.2), width: 0.5)),
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(8),
              filled: true,
              hintStyle:
                  Theme.of(context).textTheme.body1.copyWith(color: hintColor),
              errorText: errorText,
              counterText: '',
              icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
        ),
      ),
    );
  }
}
