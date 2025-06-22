import 'package:flutter/material.dart';

AppBar CreditSeaSimple() {
  return AppBar(
    titleSpacing: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Image.asset("assets/logo/image.png"),
    ),
    title: const Text('CreditSea'),
  );
}
