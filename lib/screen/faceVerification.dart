import 'package:creditsea/components/simpleAppbar.dart';
import 'package:flutter/material.dart';

class FaceverificationScreen extends StatefulWidget {
  const FaceverificationScreen({super.key});

  @override
  State<FaceverificationScreen> createState() => _FaceverificationScreenState();
}

class _FaceverificationScreenState extends State<FaceverificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreditSeaSimple(),
      body: Column(
        children: [
          Center()
        ],
      ),
    );
  }
}
