import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.labelText,
      this.hint,
      required this.keyboardType});
  final TextEditingController controller;
  final String? Function(PhoneNumber? text)? validator;
  final String? labelText;
  final String? hint;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      style: Theme.of(context).textTheme.bodyMedium,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      enabled: true,
      cursorColor: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
      dropdownIcon: Icon(Icons.arrow_drop_down_rounded,
          color: Theme.of(context).colorScheme.secondary),
      dropdownTextStyle: Theme.of(context).textTheme.bodyMedium,
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        searchFieldCursorColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        padding: const EdgeInsets.all(0),
        searchFieldPadding: const EdgeInsets.only(left: 16, top: 32, right: 16),
        width: MediaQuery.of(context).size.width,
        searchFieldInputDecoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIconColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          suffixIconColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          floatingLabelStyle: Theme.of(context).textTheme.headlineSmall,
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.headlineMedium,
          label: const Text('Search a country'),
          labelStyle: Theme.of(context).textTheme.headlineMedium,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.8))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.8))),
          suffixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.8)),
          ),
        ),
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIconColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        suffixIconColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        floatingLabelStyle: Theme.of(context).textTheme.displayMedium,
        hintText: hint,
        label: Text(labelText ?? ''),
        labelStyle: Theme.of(context).textTheme.displayMedium,
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
        contentPadding: EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8)),
        ),
      ),
    );
  }
}
