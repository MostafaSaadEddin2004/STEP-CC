import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterIconButton extends StatelessWidget {
  const RegisterIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(
            icon,
            size: 24,
          )),
    );
  }
}
