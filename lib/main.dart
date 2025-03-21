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
              const _ConfirmButtonExample(),
              const SizedBox(height: 8.0),
              ConfettiButton(text: 'Wohoo!', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmButtonExample extends StatefulWidget {
  const _ConfirmButtonExample();

  @override
  State<_ConfirmButtonExample> createState() => _ConfirmButtonExampleState();
}

class _ConfirmButtonExampleState extends State<_ConfirmButtonExample> {
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
        timer?.cancel();
        timer = Timer(Durations.medium4, () {
          setState(() {
            buttonState = ConfirmButtonState.enabled;
          });
        });
      },
    );
  }
}
