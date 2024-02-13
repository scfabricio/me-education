import 'package:flutter/material.dart';

class BlockBotton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  final buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 18),
    padding: const EdgeInsets.all(18),
  );

  BlockBotton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
