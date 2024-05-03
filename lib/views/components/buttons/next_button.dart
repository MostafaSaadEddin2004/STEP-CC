import 'package:flutter/material.dart';
import 'package:step_cc/controller/utilities/check_locale.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onPressed, required this.padding,
  });
  final void Function() onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          padding: padding,
          onPressed: onPressed,
          icon: Icon(
            size: 50,
            Direction.isLTR(context)
                ? Icons.arrow_circle_right_rounded
                : Icons.arrow_circle_left_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
