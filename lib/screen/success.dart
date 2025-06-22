import 'package:creditsea/components/appBar.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreaditSea(),
      body: Center(
        child: Image.asset("assets/logo/success.png"),
      ),
    ) ;
  }
}