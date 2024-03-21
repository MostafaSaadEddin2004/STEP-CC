import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        size: 50,
        Icons.arrow_circle_right_rounded,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
