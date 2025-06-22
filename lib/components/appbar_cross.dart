import 'package:flutter/material.dart';

AppBar CreaditSeaX({required VoidCallback onClose}) {
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
          backgroundColor: Colors.transparent,
          radius: 20,
          child: IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close),
            color: Colors.black,
          ),
        ),
      ),
      ]
  );
}
