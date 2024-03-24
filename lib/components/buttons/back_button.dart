import 'package:flutter/material.dart';
import 'package:step_cc/utilities/check_locale.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: Direction.isLTR(context)? const EdgeInsets.only(left: 16, top: 16):const EdgeInsets.only(right: 16, top: 16),
        alignment: Alignment.center,
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(4)),
        child: IconButton(
          iconSize: 24,
          padding: const EdgeInsets.all(0),
          onPressed: onTap,
          icon: Icon(
            Direction.isLTR(context)
                ? Icons.keyboard_arrow_left_rounded
                : Icons.keyboard_arrow_right_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ));
  }
}
