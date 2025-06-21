import 'package:flutter/material.dart';

AppBar CreaditSea() {
  return AppBar(
    titleSpacing: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Image.asset("assets/logo/image.png"),
    ),
    title: const Text('CreditSea'),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          radius: 20,
          child: IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          radius: 20,
          child: IconButton(
            icon: const Icon(Icons.headset_mic_outlined),
            color: Colors.black,
            onPressed: () {
              // Support action
            },
          ),
        ),
      ),
    ],
  );
}
