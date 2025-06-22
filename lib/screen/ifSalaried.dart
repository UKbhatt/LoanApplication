import 'package:creditsea/components/appBar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IfsalariedScreeen extends StatefulWidget {
  const IfsalariedScreeen({super.key});

  @override
  State<IfsalariedScreeen> createState() => _IfsalariedScreeenState();
}

class _IfsalariedScreeenState extends State<IfsalariedScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreaditSea(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Center(
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.9,
                child: StepProgressBar(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Let’s get to know your work life',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "This helps us tailor offers just for you safely and securely",
              style: GoogleFonts.poppins(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
