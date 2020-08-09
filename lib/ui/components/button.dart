import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';

class Button extends StatelessWidget {

  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final EdgeInsets padding;
  final AppTextTheme textTheme;
  final Color borderColor;
  final TextStyle textStyle;

  Button({
    @required
    this.onTap,
    @required
    this.backgroundColor,
    this.textColor = Colors.white,
    @required
    this.text,
    @required
    this.textTheme,
    this.padding = EdgeInsets.zero,
    this.borderColor,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: onTap,
        padding: padding,
        color: backgroundColor,
        textColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1,
            style: BorderStyle.solid
          )
        ),
        child: Text(
          text,
          style: textStyle ?? textTheme.subheading2Bold.copyWith(
            color: textColor
          ),
        ),
      ),
    );
  }
}
