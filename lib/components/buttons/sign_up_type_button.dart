import 'package:flutter/material.dart';

class SignUpTypeButton extends StatelessWidget {
  const SignUpTypeButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isVIP,
  });
  final void Function() onTap;
  final String text;
  final bool isVIP;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInBack,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
        padding: const EdgeInsets.all(8),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: isVIP == true
              ? Theme.of(context).colorScheme.secondary.withOpacity(1)
              : Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
