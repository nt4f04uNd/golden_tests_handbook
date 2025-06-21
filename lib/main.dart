import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golden_tests_handbook/components/confetti_button.dart';
import 'package:golden_tests_handbook/components/confirm_button.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Golden Tests handbook App')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DelayedConfirmButton(),
              const SizedBox(height: 8.0),
              ConfettiButton(text: 'Wohoo!', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class DelayedConfirmButton extends StatefulWidget {
  const DelayedConfirmButton({super.key});

  @override
  State<DelayedConfirmButton> createState() => DelayedConfirmButtonState();
}

class DelayedConfirmButtonState extends State<DelayedConfirmButton> {
  ConfirmButtonState buttonState = ConfirmButtonState.enabled;

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmButton(
      state: buttonState,
      icon: Icons.done,
      onPressed: () {
        setState(() {
          buttonState = ConfirmButtonState.loading;
        });

        // Симулируем долгую операцию через таймер.
        // В реальном мире тут мог бы быть, например, запрос в сеть.
        timer?.cancel();
        timer = Timer(Duration(seconds: 1), () {
          setState(() {
            buttonState = ConfirmButtonState.enabled;
          });
        });
      },
    );
  }
}
