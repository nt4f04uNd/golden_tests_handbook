import 'package:flutter/material.dart';

enum ConfirmButtonState { enabled, loading, disabled }

class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ConfirmButtonState state;
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? disabledColor;

  const ConfirmButton({
    required this.onPressed,
    this.state = ConfirmButtonState.enabled,
    this.text = 'Confirm',
    this.icon,
    this.backgroundColor,
    this.disabledColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: switch (state) {
        ConfirmButtonState.enabled => onPressed,
        ConfirmButtonState.loading || ConfirmButtonState.disabled => null,
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return disabledColor;
          }
          return backgroundColor;
        }),
      ),
      icon: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutCubic,
        child: switch (state) {
          ConfirmButtonState.enabled || ConfirmButtonState.disabled =>
            icon == null ? const SizedBox.shrink() : Icon(icon),
          ConfirmButtonState.loading => const SizedBox.shrink(),
        },
      ),
      label: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutCubic,
        child: switch (state) {
          ConfirmButtonState.enabled ||
          ConfirmButtonState.disabled => Text(text),
          ConfirmButtonState.loading => SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2.0),
          ),
        },
      ),
    );
  }
}
