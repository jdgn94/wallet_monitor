import 'package:flutter/material.dart';

import 'package:wallet_monitor/utils/icons.utils.dart';

enum StyleButton { standard, outlined, tonal, text, plain }

// ignore: must_be_immutable
class ButtonComponent extends StatelessWidget {
  ButtonComponent({
    super.key,
    required this.onTap,
    this.buttonStyle = StyleButton.standard,
    this.color,
    this.colorText,
    this.prependIcon,
    this.appendIcon,
    this.text,
    this.body,
    this.radius = 5.0,
  });

  final VoidCallback onTap;
  final StyleButton buttonStyle;
  final Color? color;
  final Color? colorText;
  final String? prependIcon;
  final String? appendIcon;
  final String? text;
  final Widget? body;
  final double radius;

  final padding = const EdgeInsets.all(5);
  late BorderRadius borderRadius;
  late Color buttonColor;
  late Color textColor;

  @override
  Widget build(BuildContext context) {
    borderRadius = BorderRadius.all(Radius.circular(radius));
    buttonColor = color ?? Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: onTap,
      splashColor: _splashTone(context),
      focusColor: _splashTone(context),
      hoverColor: _splashTone(context),
      highlightColor: _splashTone(context),
      borderRadius: borderRadius,
      child: _getButtonChild(context),
    );
  }

  Color _splashTone(BuildContext context) {
    if (buttonStyle == StyleButton.text) {
      return buttonColor.withAlpha(30);
    } else if (Theme.of(context).colorScheme.brightness == Brightness.dark) {
      return Colors.white.withAlpha(10);
    }
    return Colors.black.withAlpha(10);
  }

  Ink _getButtonChild(BuildContext context) {
    switch (buttonStyle) {
      case StyleButton.outlined:
        textColor = colorText ?? buttonColor;
        return Ink(
          padding: padding,
          decoration: BoxDecoration(
            border: Border.all(
              color: buttonColor,
            ),
            borderRadius: borderRadius,
          ),
          child: _bodyButton(),
        );
      case StyleButton.tonal:
        textColor = colorText ?? buttonColor;
        return Ink(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: buttonColor.withAlpha(70),
          ),
          child: _bodyButton(),
        );
      case StyleButton.text:
        textColor = colorText ?? buttonColor;
        return Ink(
          padding: padding,
          child: _bodyButton(),
        );
      case StyleButton.plain:
        textColor = colorText ?? Theme.of(context).colorScheme.onBackground;
        return Ink(
          padding: padding,
          child: _bodyButton(),
        );
      default:
        textColor = colorText ?? Theme.of(context).colorScheme.onBackground;
        return Ink(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: buttonColor,
          ),
          child: _bodyButton(),
        );
    }
  }

  Widget _bodyButton() {
    if (body != null) {
      return body!;
    }

    return Row(
      children: [
        if (appendIcon != null) Icon(getIcon(appendIcon!), color: textColor),
        if (text != null)
          Text(
            text!,
            style: TextStyle(color: textColor),
          ),
        if (prependIcon != null) Icon(getIcon(prependIcon!), color: textColor),
      ],
    );
  }
}
