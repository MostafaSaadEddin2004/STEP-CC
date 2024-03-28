import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key, required this.buttonText, this.onTap,
  });
final String buttonText;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
