// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:anime_list/gen/colors.gen.dart';

class RoundTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final String? error;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? inputColor;
  final bool? enable;
  final Color? backgroundColor;

  const RoundTextField({
    Key? key,
    this.hint,
    this.label,
    this.error,
    this.controller,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.validator,
    this.borderColor,
    this.focusBorderColor,
    this.inputColor,
    this.enable,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<RoundTextField> createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      enabled: widget.enable,
      style: TextStyle(
        color: widget.inputColor ?? Colors.black,
        fontWeight: FontWeight.w700, 
      ),
      decoration: InputDecoration(
        // isDense: true,
        fillColor: widget.backgroundColor,
        contentPadding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
        labelText: widget.label,
        hintText: widget.hint,
        errorText: widget.error,
        alignLabelWithHint: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorName.textGray, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorName.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorName.error, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorName.error, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorName.disabledBorderColor, width: 2),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          fontSize: 12,
          color: ColorName.error,
        ),
        prefix: widget.prefix,
        suffixIcon: widget.suffix,
      ),
    );
  }
}
