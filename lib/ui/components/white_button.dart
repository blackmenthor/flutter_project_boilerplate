import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/ui/components/button.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

class WhiteButton extends StatelessWidget {

  final VoidCallback onTap;
  final String text;
  final EdgeInsets padding;
  final ColorPalette colorPalette;
  final AppTextTheme textTheme;
  final Color textColor;
  final Color borderColor;
  final TextStyle textStyle;

  WhiteButton({
    @required
    this.onTap,
    @required
    this.text,
    @required
    this.colorPalette,
    @required
    this.textTheme,
    this.padding = EdgeInsets.zero,
    this.textColor,
    this.borderColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: onTap,
      padding: padding,
      backgroundColor: Colors.white,
      textColor: textColor ?? colorPalette.orange50,
      text: text,
      textTheme: textTheme,
      borderColor: borderColor,
      textStyle: textStyle,
    );
  }
}
