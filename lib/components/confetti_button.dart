import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';

class ConfettiButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ConfettiButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Confetti.launch(
          context,
          options: ConfettiOptions(particleCount: 100, spread: 70, y: 1),
        );
        onPressed.call();
      },
      child: Text(text),
    );
  }
}
