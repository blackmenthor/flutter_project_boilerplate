import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

class DefaultTextField extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction inputAction;
  final int maxLines;
  final int minLines;
  final bool hasFloatingPlaceHolder;
  final bool enabled;

  DefaultTextField({
    @required
    this.labelText,
    @required
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.inputAction,
    this.maxLines,
    this.minLines,
    this.hasFloatingPlaceHolder = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: inputAction,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 16.0,
          ),
          hasFloatingPlaceholder: hasFloatingPlaceHolder,
          alignLabelWithHint: true,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 16.0
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
          errorStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.red
          ),
          errorMaxLines: 2,
          filled: true,
          fillColor: ColorPalette().white1,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette().grey05, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette().grey05, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette().grey05, width: 1.0),
          )
      ),
    );
  }
}
