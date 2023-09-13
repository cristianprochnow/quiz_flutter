import 'package:flutter/material.dart';

class WrongIcon extends StatelessWidget {
  const WrongIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}
