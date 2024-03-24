import 'package:flutter/material.dart';
import 'package:step_cc/utilities/check_locale.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: Direction.isLTR(context)
              ? const EdgeInsets.only(right: 48, bottom: 48)
              : const EdgeInsets.only(left: 48, bottom: 48),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              size: 50,
              Direction.isLTR(context)
                  ? Icons.arrow_circle_right_rounded
                  : Icons.arrow_circle_left_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
