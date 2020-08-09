import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/ui/components/button.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

class PrimaryButton extends StatelessWidget {

  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;
  final ColorPalette colorPalette;
  final AppTextTheme textTheme;
  final TextStyle textStyle;

  PrimaryButton({
    @required
    this.onTap,
    @required
    this.text,
    @required
    this.colorPalette,
    @required
    this.textTheme,
    this.padding = EdgeInsets.zero,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: onTap,
      padding: padding,
      backgroundColor: colorPalette.primary,
      textColor: colorPalette.white,
      text: text,
      textTheme: textTheme,
      textStyle: textStyle,
    );
  }
}
