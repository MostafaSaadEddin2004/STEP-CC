import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    this.labelText,
    this.hint,
    this.obscure,
    this.maxLine,
    this.keyboardType,
    this.prefix,
    this.suffix,
  });
  final TextEditingController controller;
  final String? Function(String? text) validator;
  final String? labelText;
  final String? hint;
  final bool? obscure;
  final int? maxLine;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      style: Theme.of(context).textTheme.bodyMedium,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscure!,
      enabled: true,
      cursorColor: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIconColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        suffixIconColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        floatingLabelStyle: Theme.of(context).textTheme.headlineSmall,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.headlineMedium,
        label: Text(labelText ?? ''),
        labelStyle: Theme.of(context).textTheme.headlineMedium,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.8))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.8))),
        prefixIcon: prefix,
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8)),
        ),
      ),
    );
  }
}
