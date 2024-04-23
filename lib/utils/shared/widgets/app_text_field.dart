import 'package:demo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final TextStyle? labelStyle;
  final String? initValue;
  final Function(String?) onChanged;

  const AppTextField(
      {super.key,
      required this.label,
      this.labelStyle,
      this.controller,
      this.initValue,
      required this.onChanged});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    if (widget.initValue != null && widget.controller != null) {
      widget.controller!.text = widget.initValue ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: context.textTheme.labelSmall),
          const SizedBox(height: 10)
        ],
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.grayFBFBFD,
          ),
          alignment: Alignment.center,
          child: TextField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            style: context.textTheme.displayMedium,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 10, left: 15),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
