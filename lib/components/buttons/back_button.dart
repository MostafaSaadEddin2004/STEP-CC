import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(4)),
        child: Icon(
          Localizations.localeOf(context).languageCode == 'en' ?
          Icons.keyboard_arrow_left_rounded: Icons.keyboard_arrow_right_rounded,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
