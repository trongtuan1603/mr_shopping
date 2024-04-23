import 'package:demo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppButtonType { transparent, fill }

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final TextStyle? textStyle;
  final AppButtonType? type;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.textStyle,
      this.type = AppButtonType.fill});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        splashColor: Colors.white.withOpacity(0.05),
        splashFactory: InkRipple.splashFactory,
        child: Ink(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
              color: type == AppButtonType.fill
                  ? AppColors.primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              title,
              style: (textStyle ?? context.textTheme.displayMedium)?.copyWith(
                  color:
                      type == AppButtonType.fill ? Colors.white : AppColors.primaryColor),
            ),
          ),
        ));
  }
}
